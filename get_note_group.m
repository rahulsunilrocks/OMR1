function [ locs_group_size ] = get_note_group( locs_bb, n )
    for i_img=1:n
        bb_mat = cell2mat(locs_bb{i_img});
        for i = 1:length(locs_bb{i_img})
            locs_group_size{i_img}(i) = length(find(bb_mat(1:4:end) == locs_bb{i_img}{i}(1)));
        end
    end

end
