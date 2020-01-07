days = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];

months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"];

years = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
hours = [
    "00", "01", "02", "03", "04", "05", 
    "06", "07", "08", "09", "10", "11",
    "12", "13", "14", "15", "16", "17", 
    "18", "19", "20", "21", "22", "23"
];

hours_sparse = [
    "00",  "03", 
    "06",  "09",
    "12",  "15", 
    "18",  "21",
];

$fn=120;
labels = days;
clork_radius = 100;
hole_radius = 5.5;
bar_length = 40;
thickness = 6;
font="Consolas:style=Bold";
letter_height=.4;

m2_tap=1.75/2;
m3_tap=2.7/2;

num=len(labels);

rotate([0, 0, 45]){
difference(){
difference(){
difference(){
difference(){
difference(){
difference(){
difference(){
difference(){
difference(){
difference(){
    cylinder(thickness, clork_radius, clork_radius);
    translate([0,0,-1]){
      cylinder(thickness + 2, hole_radius, hole_radius);
    }
}

translate([17.5, 8, -1])
    cylinder(thickness - 1, m3_tap);
}
translate([-17.5, 8, -1])
    cylinder(thickness - 1, m3_tap);
}

translate([-11.25, -26.25, -1])
    cylinder(thickness - 1, m2_tap);
}
translate([11.25, -26.25, -1])
    cylinder(thickness - 1, m2_tap);
}
translate([-11.25, -52.5, -1])
    cylinder(thickness - 1, m2_tap);
}
translate([11.25, -52.5, -1])
    cylinder(thickness - 1, m2_tap);
}
rotate(90)
translate([clork_radius - 10, 0, -1])
    cylinder(thickness - 1, m3_tap);
}
rotate(90 + 120)
translate([clork_radius - 10, 0, -1])
    cylinder(thickness - 1, m3_tap);
}
rotate(90 + 120 * 2)
translate([clork_radius - 10, 0, -1])
    cylinder(thickness - 1, m3_tap);
}
for (i=[0:num])  {
  rotate(360/num * (num - i)) {
    translate([0, clork_radius - bar_length/2, thickness]) {
      color("green") {
        cube([0.8, bar_length, 1.6], true);
        translate([12, bar_length/2 - 3, -1.4]) {
          rotate(90) {
            linear_extrude(height = 2) 
            text(labels[i], font=font, size=10, halign="right", $fn=16);
          }
        }
      }
    }
  }
}
}


