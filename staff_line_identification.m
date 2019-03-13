function [ staff_lines ] = staff_line_identification( bw_image )
    se_line = strel('line', length(bw_image)*0.005, 0);
    bw_image = imerode(bw_image, se_line);

    [pks, locs] = findpeaks(sum(bw_image,2));

    tresh = pks > max(pks)/5;
    locs = locs .* tresh;
    pks = pks .* tresh;

    pks_tresh = pks(pks~=0);
    locs_tresh = locs(locs~=0);
    staff_lines = [];

    if mod(length(locs_tresh), 5) == 0
        staff_lines = locs_tresh;
    else
        staff_lines = locs_tresh;
        
        while ~ mod(length(staff_lines), 5) == 0
            index = find(pks_tresh == min(pks_tresh));
            pks_tresh(index) = [];
            staff_lines(index) = [];

            pks_tresh = pks_tresh(pks_tresh~=0);
            staff_lines = staff_lines(staff_lines~=0);
        end
    end
end
