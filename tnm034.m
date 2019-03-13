function strout = tnm034( image )

    strout = '';
    [height_start, height_end, width_start, width_end] = naive_crop(image);
    bw = 1-imbinarize(image(height_start:height_end,width_start:width_end,3),...
        'adaptive','ForegroundPolarity','dark','Sensitivity',0.4);
    bw = rotate_image(bw);
    staff_lines = staff_line_identification(bw);

    if ~isempty(staff_lines)
        bw_no_sl = remove_stafflines(bw, staff_lines);
        split_pos = get_split_positions(bw, staff_lines);
        n = length(split_pos)-1;
        subimg = split_images(bw, split_pos);
        subimg_no_sl = split_images(bw_no_sl, split_pos);
        subimg_clean = clean_image(subimg_no_sl, n);
        subimg_staff_lines = map_stafflines_to_subimages(staff_lines, split_pos);
        [locs_x, locs_y] = find_note_locations(subimg, n);
        [locs_bb, subimg_clean] = get_bounding_boxes(locs_x, locs_y, subimg_clean, n);
        locs_group_size = get_note_group(locs_bb, n);
        [locs_fourth_note, locs_eighth_note] = get_note_type(locs_x, locs_y, locs_bb, locs_group_size, subimg_clean, n);
        strout = get_note_pitch(locs_eighth_note, locs_fourth_note, locs_y, subimg_staff_lines, n);
    end
end
