local part = workspace.PointElectric
part:ClearAllChildren()
local emitter = Instance.new("ParticleEmitter", part)
emitter.Texture = "rbxassetid://243098098"
local ckp = ColorSequenceKeypoint.new
local nkp = NumberSequenceKeypoint.new
emitter.Color = ColorSequence.new{
	ckp(0, Color3.fromRGB(70, 155, 255));
	ckp(0.972, Color3.fromRGB(255, 255, 255));
	ckp(1, Color3.fromRGB(255, 255, 255));
}
emitter.Size = NumberSequence.new{
	nkp(0, 1);
	nkp(0.0769, 3.37);
	nkp(0.14, 0.312);
	nkp(0.206, 3.62);
	nkp(0.253, 0.188);
	nkp(0.347, 3.5);
	nkp(0.405, 0.0625);
	nkp(0.448, 3.5);
	nkp(0.496, 0.312);
	nkp(0.58, 3.81);
	nkp(0.619, 0.25);
	nkp(0.682, 3.69);
	nkp(0.722, 0.188);
	nkp(0.782, 3.69);
	nkp(0.8, 0.0625);
	nkp(0.853, 3.62);
	nkp(0.905, 0.0625);
	nkp(0.952, 4.06);
	nkp(1, 1);
}
emitter.Lifetime = NumberRange.new(1, 5)
emitter.Rate = 25
emitter.Rotation = NumberRange.new(0, 360)
emitter.Speed = NumberRange.new(0)
emitter.EmissionDirection = "Bottom"
emitter.LightEmission = 1
emitter.LightInfluence = 0