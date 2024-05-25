let prevMin = new Vec3(-0.7118004161572398, 1, -4.453120308642768)
let prevMax = new Vec3(-0.11180041615723973, 2.8, -3.8531203086427688)

let guiltyMin = new Vec3(-0.5186817377991014, 1, -4.38721207672062)
let guiltyMax = new Vec3(0.08131826220089855, 2.8, -3.7872120767206203)

let size = new Vec3(0.6, 1.8, 0.6);

game.player.setBoundingBox(new AABB(prevMin, prevMax, size));
