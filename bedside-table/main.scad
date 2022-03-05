include <shelf.scad>;

$fn = 100;

// All dimensions in mm

outer_thickness = 20;
base_thickness = 30;

drawer_height = 150;
num_drawers = 3;

width = 400;
depth = 400;
height = (base_thickness - outer_thickness) + ((drawer_height + outer_thickness) * num_drawers);

top_overlap = 10;

// NOTE: VECTORS ARE [WIDTH, DEPTH, HEIGHT]

module top() {
  translate([-top_overlap / 2, -top_overlap / 2, height])
  minkowski() {
    cube([width + top_overlap, depth + top_overlap, outer_thickness / 2]);
    cylinder(r=top_overlap, h=outer_thickness / 2);
  }
}

module shelves() {
  starting_height = base_thickness - outer_thickness;
  diff = outer_thickness + drawer_height;

  for (i = [1: num_drawers - 1]) {
    translate([outer_thickness / 2, -0.1, starting_height + (diff * i)])
    cube([width - outer_thickness, depth - outer_thickness + 1, outer_thickness]);
  }
}

module side() {
  translate([0, 0, base_thickness])
  cube([outer_thickness, depth, height - base_thickness]);
}

module back() {
  translate([outer_thickness, depth, base_thickness])
  rotate([0, 0, -90])
  cube([outer_thickness, width - (outer_thickness * 2), height - base_thickness]);
}

module main() {
  difference() {
    union() {

      side();

      translate([width - outer_thickness, 0, 0])
      side();

    }
    shelves();
  }

  color("blue")
  back();

  color("red")
  cube([width, depth, base_thickness]); // Base

  color("green")
  shelves();

  color("purple")
  top();
}

main();
