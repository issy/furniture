module shelf(groove_depth, ) {
  translate([outer_thickness / 2, -0.1, starting_height + (diff * i)])
  cube([width - outer_thickness, depth - outer_thickness + 1, outer_thickness]);
}

module shelves(base_thickness, outer_thickness, drawer_height, num_drawers, depth) {
  starting_height = base_thickness - outer_thickness;
  diff = outer_thickness + drawer_height;

  for (i = [1: num_drawers - 1]) {
    translate([outer_thickness / 2, -0.1, starting_height + (diff * i)])
    cube([width - outer_thickness, depth - outer_thickness + 1, outer_thickness]);
  }
}
