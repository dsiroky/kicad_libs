lead_dist = 2.54;

module straight_lead()
{
  d = 0.64;
  l = 14.3;

  color([1, 1, 0])
  translate([0, 0, l / 2  - (l - 11.4)]) // "sink" the lead
  difference()
  {
    cube([d, d, l], center=true);
    union() {
      // cubes cutting the tip
      for (rot = [0, 90, 180, 270])
      {
        translate([0, 0, l / 2])
        rotate([0, 0, rot])
        translate([0, d / 2 + 0.2, 0])
        rotate([20, 0, 0])
          cube(d + 0.01, center=true);
      }
    }
  }
}

module body(leads_count)
{
  width = leads_count * lead_dist;
  lock_width = (leads_count - 1) * lead_dist;

  color([1, 0.8, 0.8]) union()
  {
    // bottom body
    translate([-width / 2, -3.26, 0])
      cube([width, 5.8, 3.3]);

    // lock
    translate([-lock_width / 2, -3.26 + 5.8 - 1, 0])
      cube([lock_width, 1, 11.4]);
  }
}

module psh02(leads_count)
{
  start = (leads_count % 2 == 0) ?
              -(leads_count / 2) + 0.5 : -(leads_count - 1) / 2;
  for (pos = [0:leads_count - 1])
    translate([lead_dist * (pos + start), 0, 0]) straight_lead();

  body(leads_count);
}
