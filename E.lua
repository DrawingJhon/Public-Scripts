local RealGame = game
local game = nil

do
	local fakegame = setmetatable({}, {
		__index = function(self, index)
			if index == "CoreGui" then
				return owner.PlayerGui
			end
			if index == "GetService" or index == "getService" or index == "service" or index == "FindService" or index == "findService" then
				return function(tab, service)
					return service == "CoreGui" and owner.PlayerGui or RealGame:GetService(service)
				end
			end
			if type(RealGame[index]) == "function" then
				return function(tab, ...)
					tab = tab == self and RealGame or tab
					return RealGame[index](tab, ...)
				end
			end
			return RealGame[index]
		end,
		__newindex = function(self, index, value)
			RealGame[index] = value
		end,
		__metatable = "The metatable is locked"
	})
	game = fakegame
end

lightingPropertes = {
	"Ambient",
	"Brightness",
	"ColorShift_Bottom",
	"ColorShift_Top",
	"GlobalShadows",
	"OutdoorAmbient",
	"Outlines",
	"GeographicLatitude",
	"TimeOfDay",
	"FogColor",
	"FogEnd",
	"FogStart",
}
supportedClasses = {
["Accoutrement"] = true,
["Accessory"] = true,
["Hat"] = true,
["Animation"] = true,
["AnimationController"] = true,
["Beam"] = true,
["BindableEvent"] = true,
["BindableFunction"] = true,
["BodyAngularVelocity"] = true,
["BodyForce"] = true,
["BodyGyro"] = true,
["BodyPosition"] = true,
["BodyThrust"] = true,
["BodyVelocity"] = true,
["RocketPropulsion"] = true,
["Camera"] = true,
["BodyColors"] = true,
["CharacterMesh"] = true,
["Pants"] = true,
["Shirt"] = true,
["ShirtGraphic"] = true,
["Skin"] = true,
["ClickDetector"] = true,
["Configuration"] = true,
["AlignOrientation"] = true,
["AlignPosition"] = true,
["BallSocketConstraint"] = true,
["HingeConstraint"] = true,
["LineForce"] = true,
["RodConstraint"] = true,
["RopeConstraint"] = true,
["CylindricalConstraint"] = true,
["PrismaticConstraint"] = true,
["SpringConstraint"] = true,
["Torque"] = true,
["VectorForce"] = true,
["HumanoidController"] = true,
["SkateboardController"] = true,
["VehicleController"] = true,
["CustomEvent"] = true,
["CustomEventReceiver"] = true,
["BlockMesh"] = true,
["CylinderMesh"] = true,
["FileMesh"] = true,
["SpecialMesh"] = true,
["Dialog"] = true,
["DialogChoice"] = true,
["Explosion"] = true,
["Decal"] = true,
["Texture"] = true,
["Hole"] = true,
["MotorFeature"] = true,
["Fire"] = true,
["FlyweightService"] = true,
["CSGDictionaryService"] = true,
["NonReplicatedCSGDictionaryService"] = true,
["Folder"] = true,
["ForceField"] = true,
["FunctionalTest"] = true,
["Frame"] = true,
["ImageButton"] = true,
["TextButton"] = true,
["ImageLabel"] = true,
["TextLabel"] = true,
["ScrollingFrame"] = true,
["TextBox"] = true,
["BillboardGui"] = true,
["ScreenGui"] = true,
["GuiMain"] = true,
["SurfaceGui"] = true,
["FloorWire"] = true,
["BoxHandleAdornment"] = true,
["ConeHandleAdornment"] = true,
["CylinderHandleAdornment"] = true,
["ImageHandleAdornment"] = true,
["LineHandleAdornment"] = true,
["SphereHandleAdornment"] = true,
["SelectionBox"] = true,
["SelectionSphere"] = true,
["ArcHandles"] = true,
["Handles"] = true,
["SurfaceSelection"] = true,
["SelectionPartLasso"] = true,
["SelectionPointLasso"] = true,
["Backpack"] = true,
["HopperBin"] = true,
["Tool"] = true,
["Flag"] = true,
["Humanoid"] = true,
["RotateP"] = true,
["RotateV"] = true,
["Glue"] = true,
["ManualGlue"] = true,
["ManualWeld"] = true,
["Motor"] = true,
["Motor6D"] = true,
["Rotate"] = true,
["Snap"] = true,
["VelocityMotor"] = true,
["Weld"] = true,
["Keyframe"] = true,
["KeyframeSequence"] = true,
["PointLight"] = true,
["SpotLight"] = true,
["SurfaceLight"] = true,
["LocalizationTable"] = true,
["Script"] = true,
["LocalScript"] = true,
["ModuleScript"] = true,
["Message"] = true,
["Hint"] = true,
["CornerWedgePart"] = true,
["Part"] = true,
["FlagStand"] = true,
["Seat"] = true,
["SkateboardPlatform"] = true,
["SpawnLocation"] = true,
["WedgePart"] = true,
["MeshPart"] = true,
["PartOperation"] = true,
["NegateOperation"] = true,
["UnionOperation"] = true,
["TrussPart"] = true,
["VehicleSeat"] = true,
["Model"] = true,
["PartOperationAsset"] = true,
["ParticleEmitter"] = true,
["PluginAction"] = true,
["Pose"] = true,
["BloomEffect"] = true,
["BlurEffect"] = true,
["ColorCorrectionEffect"] = true,
["SunRaysEffect"] = true,
["ReflectionMetadata"] = true,
["ReflectionMetadataCallbacks"] = true,
["ReflectionMetadataClasses"] = true,
["ReflectionMetadataEnums"] = true,
["ReflectionMetadataEvents"] = true,
["ReflectionMetadataFunctions"] = true,
["ReflectionMetadataClass"] = true,
["ReflectionMetadataEnum"] = true,
["ReflectionMetadataEnumItem"] = true,
["ReflectionMetadataMember"] = true,
["ReflectionMetadataProperties"] = true,
["ReflectionMetadataYieldFunctions"] = true,
["RemoteEvent"] = true,
["RemoteFunction"] = true,
["Sky"] = true,
["Smoke"] = true,
["Sound"] = true,
["ChorusSoundEffect"] = true,
["CompressorSoundEffect"] = true,
["DistortionSoundEffect"] = true,
["EchoSoundEffect"] = true,
["EqualizerSoundEffect"] = true,
["FlangeSoundEffect"] = true,
["PitchShiftSoundEffect"] = true,
["ReverbSoundEffect"] = true,
["TremoloSoundEffect"] = true,
["SoundGroup"] = true,
["Sparkles"] = true,
["StarterGear"] = true,
["StarterPlayerScripts"] = true,
["StarterCharacterScripts"] = true,
["Team"] = true,
["TerrainRegion"] = true,
["TestService"] = true,
["Trail"] = true,
["Tween"] = true,
["UIAspectRatioConstraint"] = true,
["UISizeConstraint"] = true,
["UITextSizeConstraint"] = true,
["UIGridLayout"] = true,
["UIListLayout"] = true,
["UIPageLayout"] = true,
["UITableLayout"] = true,
["UIPadding"] = true,
["UIScale"] = true,
["BinaryStringValue"] = true,
["BoolValue"] = true,
["BrickColorValue"] = true,
["CFrameValue"] = true,
["Color3Value"] = true,
["DoubleConstrainedValue"] = true,
["IntConstrainedValue"] = true,
["IntValue"] = true,
["NumberValue"] = true,
["ObjectValue"] = true,
["RayValue"] = true,
["StringValue"] = true,
["Vector3Value"] = true,
["VirtualInputManager"] = true,
["WeldConstraint"] = true,
}
supportedProperties = {
"Archivable",
"ClassName",
"DataCost",
"Name",
"Parent",
"RobloxLocked",
"archivable",
"className",
"AttachmentForward",
"AttachmentPoint",
"AttachmentPos",
"AttachmentRight",
"AttachmentUp",
"AnimationId",
"Animation",
"IsPlaying",
"Length",
"Looped",
"Priority",
"Speed",
"TimePosition",
"WeightCurrent",
"WeightTarget",
"Axis",
"CFrame",
"Orientation",
"Position",
"Rotation",
"SecondaryAxis",
"Visible",
"WorldAxis",
"WorldCFrame",
"WorldOrientation",
"WorldPosition",
"WorldRotation",
"WorldSecondaryAxis",
"SelectionImageObject",
"Version",
"CurrentScreenOrientation",
"ScreenOrientation",
"ProcessUserInput",
"ResetPlayerGuiOnSpawn",
"ShowDevelopmentGui",
"Attachment0",
"Attachment1",
"Color",
"CurveSize0",
"CurveSize1",
"Enabled",
"FaceCamera",
"LightEmission",
"LightInfluence",
"Segments",
"Texture",
"TextureLength",
"TextureMode",
"TextureSpeed",
"Transparency",
"Width0",
"Width1",
"ZOffset",
"AngularVelocity",
"MaxTorque",
"P",
"angularvelocity",
"maxTorque",
"Force",
"force",
"D",
"cframe",
"MaxForce",
"maxForce",
"position",
"Location",
"location",
"Velocity",
"velocity",
"CartoonFactor",
"MaxSpeed",
"MaxThrust",
"Target",
"TargetOffset",
"TargetRadius",
"ThrustD",
"ThrustP",
"TurnD",
"TurnP",
"ClickableWhenViewportHidden",
"Icon",
"CameraSubject",
"CameraType",
"CoordinateFrame",
"FieldOfView",
"Focus",
"HeadLocked",
"HeadScale",
"NearPlaneZ",
"ViewportSize",
"focus",
"HeadColor",
"HeadColor3",
"LeftArmColor",
"LeftArmColor3",
"LeftLegColor",
"LeftLegColor3",
"RightArmColor",
"RightArmColor3",
"RightLegColor",
"RightLegColor3",
"TorsoColor",
"TorsoColor3",
"BaseTextureId",
"BodyPart",
"MeshId",
"OverlayTextureId",
"PantsTemplate",
"ShirtTemplate",
"Graphic",
"SkinColor",
"LoadDefaultChat",
"CursorIcon",
"MaxActivationDistance",
"MaxAngularVelocity",
"PrimaryAxisOnly",
"ReactionTorqueEnabled",
"Responsiveness",
"RigidityEnabled",
"ApplyAtCenterOfMass",
"MaxVelocity",
"ReactionForceEnabled",
"LimitsEnabled",
"Radius",
"Restitution",
"TwistLimitsEnabled",
"TwistLowerAngle",
"TwistUpperAngle",
"UpperAngle",
"ActuatorType",
"AngularSpeed",
"CurrentAngle",
"LowerAngle",
"MotorMaxAcceleration",
"MotorMaxTorque",
"ServoMaxTorque",
"TargetAngle",
"InverseSquareLaw",
"Magnitude",
"CurrentDistance",
"Thickness",
"CurrentPosition",
"LowerLimit",
"MotorMaxForce",
"ServoMaxForce",
"Size",
"TargetPosition",
"UpperLimit",
"AngularActuatorType",
"AngularLimitsEnabled",
"AngularRestitution",
"InclinationAngle",
"MotorMaxAngularAcceleration",
"RotationAxisVisible",
"WorldRotationAxis",
"Coils",
"CurrentLength",
"Damping",
"FreeLength",
"MaxLength",
"MinLength",
"Stiffness",
"RelativeTo",
"Torque",
"BaseUrl",
"RequestQueueSize",
"Steer",
"Throttle",
"Source",
"Offset",
"Scale",
"VertexColor",
"TextureId",
"MeshType",
"AutomaticRetry",
"LegacyNamingScheme",
"MaxItems",
"DataModel",
"ErrorReporting",
"GfxCard",
"InstanceCount",
"IsFmodProfilingEnabled",
"IsScriptStackTracingEnabled",
"JobCount",
"LuaRamLimit",
"OsIs64Bit",
"OsPlatform",
"OsPlatformId",
"OsVer",
"PlayerCount",
"ReportSoundWarnings",
"RobloxProductName",
"RobloxVersion",
"SIMD",
"SystemProductName",
"TickCountPreciseOverride",
"VideoMemory",
"Condition",
"IsEnabled",
"Line",
"DebuggingEnabled",
"Expression",
"BehaviorType",
"ConversationDistance",
"GoodbyeChoiceActive",
"GoodbyeDialog",
"InUse",
"InitialPrompt",
"Purpose",
"Tone",
"TriggerDistance",
"TriggerOffset",
"ResponseDialog",
"UserDialog",
"BlastPressure",
"BlastRadius",
"DestroyJointRadiusPercent",
"ExplosionType",
"Face",
"Color3",
"LocalTransparencyModifier",
"Shiny",
"Specular",
"StudsPerTileU",
"StudsPerTileV",
"FaceId",
"InOut",
"LeftRight",
"TopBottom",
"Heat",
"SecondaryColor",
"size",
"Description",
"AdditionalCoreIncludeDirs",
"BubbleChatLifetime",
"BubbleChatMaxBubbles",
"ChatHistory",
"ChatScrollLength",
"CollisionSoundEnabled",
"CollisionSoundVolume",
"HardwareMouse",
"MaxCollisionSounds",
"OverrideStarterScript",
"ReportAbuseChatHistory",
"SoftwareSound",
"VideoCaptureEnabled",
"VideoQuality",
"AbsolutePosition",
"AbsoluteRotation",
"AbsoluteSize",
"AutoLocalize",
"Localize",
"RootLocalizationTable",
"Active",
"AnchorPoint",
"BackgroundColor",
"BackgroundColor3",
"BackgroundTransparency",
"BorderColor",
"BorderColor3",
"BorderSizePixel",
"ClipsDescendants",
"Draggable",
"LayoutOrder",
"NextSelectionDown",
"NextSelectionLeft",
"NextSelectionRight",
"NextSelectionUp",
"Selectable",
"SizeConstraint",
"SizeFromContents",
"ZIndex",
"Style",
"AutoButtonColor",
"Modal",
"Selected",
"Image",
"ImageColor3",
"ImageRectOffset",
"ImageRectSize",
"ImageTransparency",
"IsLoaded",
"ScaleType",
"SliceCenter",
"TileSize",
"Font",
"FontSize",
"LineHeight",
"LocalizedText",
"Text",
"TextBounds",
"TextColor",
"TextColor3",
"TextFits",
"TextScaled",
"TextSize",
"TextStrokeColor3",
"TextStrokeTransparency",
"TextTransparency",
"TextTruncate",
"TextWrap",
"TextWrapped",
"TextXAlignment",
"TextYAlignment",
"ScaleEdgeSize",
"SlicePrefix",
"AbsoluteWindowSize",
"BottomImage",
"CanvasPosition",
"CanvasSize",
"ElasticBehavior",
"HorizontalScrollBarInset",
"MidImage",
"ScrollBarThickness",
"ScrollingDirection",
"ScrollingEnabled",
"TopImage",
"VerticalScrollBarInset",
"VerticalScrollBarPosition",
"ClearTextOnFocus",
"ManualFocusRelease",
"MultiLine",
"OverlayNativeInput",
"PlaceholderColor3",
"PlaceholderText",
"ShowNativeInput",
"ResetOnSpawn",
"ZIndexBehavior",
"Adornee",
"AlwaysOnTop",
"ExtentsOffset",
"ExtentsOffsetWorldSpace",
"MaxDistance",
"PlayerToHideFrom",
"SizeOffset",
"StudsOffset",
"StudsOffsetWorldSpace",
"HostWidgetWasRestored",
"Title",
"DisplayOrder",
"ToolPunchThroughDistance",
"CycleOffset",
"From",
"StudsBetweenTextures",
"TextureSize",
"To",
"WireRadius",
"SizeRelativeOffset",
"Height",
"A",
"B",
"C",
"Range",
"LineThickness",
"SurfaceColor",
"SurfaceColor3",
"SurfaceTransparency",
"Axes",
"Faces",
"TargetSurface",
"Humanoid",
"Part",
"Point",
"BinType",
"CanBeDropped",
"Grip",
"GripForward",
"GripPos",
"GripRight",
"GripUp",
"ManualActivationOnly",
"RequiresHandle",
"ToolTip",
"TeamColor",
"AutoSelectGuiEnabled",
"CoreEffectFolder",
"CoreGuiFolder",
"CoreGuiNavigationEnabled",
"GuiNavigationEnabled",
"IsModalDialog",
"IsWindows",
"MenuIsOpen",
"SelectedCoreObject",
"SelectedObject",
"HttpEnabled",
"AutoJumpEnabled",
"AutoRotate",
"CameraOffset",
"DisplayDistanceType",
"FloorMaterial",
"Health",
"HealthDisplayDistance",
"HealthDisplayType",
"HipHeight",
"Jump",
"JumpPower",
"LeftLeg",
"MaxHealth",
"MaxSlopeAngle",
"MoveDirection",
"NameDisplayDistance",
"NameOcclusion",
"PlatformStand",
"RigType",
"RightLeg",
"RootPart",
"SeatPart",
"Sit",
"TargetPoint",
"Torso",
"WalkSpeed",
"WalkToPart",
"WalkToPoint",
"maxHealth",
"Delta",
"KeyCode",
"UserInputState",
"UserInputType",
"AllowInsertFreeModels",
"C0",
"C1",
"Part0",
"Part1",
"part1",
"BaseAngle",
"F0",
"F1",
"F2",
"F3",
"DesiredAngle",
"Transform",
"Hole",
"Time",
"Loop",
"Brightness",
"Shadows",
"Angle",
"Ambient",
"ClockTime",
"ColorShift_Bottom",
"ColorShift_Top",
"FogColor",
"FogEnd",
"FogStart",
"GeographicLatitude",
"GlobalShadows",
"OutdoorAmbient",
"Outlines",
"ShadowColor",
"TimeOfDay",
"ForcePlayModeRobloxLocaleId",
"IsTextScraperRunning",
"RobloxForcePlayModeRobloxLocaleId",
"RobloxLocaleId",
"SystemLocaleId",
"DevelopmentLanguage",
"Root",
"SourceLocaleId",
"AreScriptStartsReported",
"DefaultWaitTime",
"GcFrequency",
"GcLimit",
"GcPause",
"GcStepMul",
"WaitingThreadsBudget",
"Disabled",
"LinkedSource",
"Hit",
"Origin",
"TargetFilter",
"UnitRay",
"ViewSizeX",
"ViewSizeY",
"X",
"Y",
"hit",
"target",
"Ticket",
"Port",
"ArePhysicsRejectionsReported",
"ClientPhysicsSendRate",
"DataGCRate",
"DataMtuAdjust",
"DataSendPriority",
"DataSendRate",
"ExtraMemoryUsed",
"FreeMemoryMBytes",
"IncommingReplicationLag",
"IsQueueErrorComputed",
"NetworkOwnerRate",
"PhysicsMtuAdjust",
"PhysicsSendPriority",
"PhysicsSendRate",
"PreferredClientPort",
"PrintBits",
"PrintEvents",
"PrintFilters",
"PrintInstances",
"PrintPhysicsErrors",
"PrintProperties",
"PrintSplitMessage",
"PrintStreamInstanceQuota",
"PrintTouches",
"ReceiveRate",
"RenderStreamedRegions",
"ShowActiveAnimationAsset",
"TouchSendRate",
"TrackDataTypes",
"TrackPhysicsDetails",
"UseInstancePacketCache",
"UsePhysicsPacketCache",
"Anchored",
"BackParamA",
"BackParamB",
"BackSurface",
"BackSurfaceInput",
"BottomParamA",
"BottomParamB",
"BottomSurface",
"BottomSurfaceInput",
"BrickColor",
"CanCollide",
"CenterOfMass",
"CollisionGroupId",
"CustomPhysicalProperties",
"Elasticity",
"Friction",
"FrontParamA",
"FrontParamB",
"FrontSurface",
"FrontSurfaceInput",
"LeftParamA",
"LeftParamB",
"LeftSurface",
"LeftSurfaceInput",
"Locked",
"Material",
"ReceiveAge",
"Reflectance",
"ResizeIncrement",
"ResizeableFaces",
"RightParamA",
"RightParamB",
"RightSurface",
"RightSurfaceInput",
"RotVelocity",
"SpecificGravity",
"TopParamA",
"TopParamB",
"TopSurface",
"TopSurfaceInput",
"brickColor",
"FormFactor",
"formFactor",
"Shape",
"Occupant",
"Controller",
"ControllingHumanoid",
"StickyWheels",
"AllowTeamChangeOnTouch",
"Duration",
"Neutral",
"TextureID",
"TriangleCount",
"UsePartColor",
"IsSmooth",
"MaxExtents",
"WaterColor",
"WaterReflectance",
"WaterTransparency",
"WaterWaveSize",
"WaterWaveSpeed",
"AreHingesDetected",
"HeadsUpDisplay",
"SteerFloat",
"ThrottleFloat",
"TurnSpeed",
"PrimaryPart",
"AllowThirdPartySales",
"CurrentCamera",
"DistributedGameTime",
"FallenPartsDestroyHeight",
"FilteringEnabled",
"Gravity",
"StreamingEnabled",
"Terrain",
"IsFinished",
"Acceleration",
"Drag",
"EmissionDirection",
"Lifetime",
"LockedToPart",
"Rate",
"RotSpeed",
"SpreadAngle",
"VelocityInheritance",
"VelocitySpread",
"Status",
"EmptyCutoff",
"AllowSleep",
"AreAnchorsShown",
"AreAssembliesShown",
"AreAwakePartsHighlighted",
"AreBodyTypesShown",
"AreContactIslandsShown",
"AreContactPointsShown",
"AreJointCoordinatesShown",
"AreMechanismsShown",
"AreModelCoordsShown",
"AreOwnersShown",
"ArePartCoordsShown",
"AreRegionsShown",
"AreUnalignedPartsShown",
"AreWorldCoordsShown",
"DisableCSGv2",
"IsReceiveAgeShown",
"IsTreeShown",
"ParallelPhysics",
"PhysicsAnalyzerEnabled",
"PhysicsEnvironmentalThrottle",
"ShowDecompositionGeometry",
"ThrottleAdjustTime",
"UseCSGv2",
"AccountAge",
"AppearanceDidLoad",
"CameraMaxZoomDistance",
"CameraMinZoomDistance",
"CameraMode",
"CanLoadCharacterAppearance",
"Character",
"CharacterAppearance",
"CharacterAppearanceId",
"ChatMode",
"DataComplexity",
"DataComplexityLimit",
"DataReady",
"DevCameraOcclusionMode",
"DevComputerCameraMode",
"DevComputerMovementMode",
"DevEnableMouseLock",
"DevTouchCameraMode",
"DevTouchMovementMode",
"DisplayName",
"FollowUserId",
"Guest",
"LocaleId",
"MaximumSimulationRadius",
"MembershipType",
"ReplicationFocus",
"RespawnLocation",
"SimulationRadius",
"Team",
"Teleported",
"TeleportedIn",
"UserId",
"VRDevice",
"userId",
"BubbleChat",
"CharacterAutoLoads",
"ClassicChat",
"LocalPlayer",
"MaxPlayers",
"MaxPlayersInternal",
"NumPlayers",
"PreferredPlayers",
"PreferredPlayersInternal",
"localPlayer",
"numPlayers",
"CollisionEnabled",
"GridSize",
"ActionId",
"StatusTip",
"EasingDirection",
"EasingStyle",
"MaskWeight",
"Weight",
"Intensity",
"Threshold",
"Contrast",
"Saturation",
"TintColor",
"Spread",
"Browsable",
"ClassCategory",
"Constraint",
"Deprecated",
"EditingDisabled",
"IsBackend",
"ScriptContext",
"UIMaximum",
"UIMinimum",
"UINumTicks",
"summary",
"ExplorerImageIndex",
"ExplorerOrder",
"Insertable",
"PreferredParent",
"AutoFRMLevel",
"EagerBulkExecution",
"EditQualityLevel",
"EnableFRM",
"ExportMergeByMaterial",
"FrameRateManager",
"GraphicsMode",
"MeshCacheSize",
"QualityLevel",
"ReloadAssets",
"RenderCSGTrianglesDebug",
"ShowBoundingBoxes",
"ScriptsDisabled",
"CurrentLine",
"IsDebugging",
"IsPaused",
"Script",
"CreatorId",
"CreatorType",
"GameId",
"GearGenreSetting",
"Genre",
"IsSFFlagsLoaded",
"JobId",
"PlaceId",
"PlaceVersion",
"VIPServerId",
"VIPServerOwnerId",
"Workspace",
"lighting",
"workspace",
"CelestialBodiesShown",
"MoonAngularSize",
"MoonTextureId",
"SkyboxBk",
"SkyboxDn",
"SkyboxFt",
"SkyboxLf",
"SkyboxRt",
"SkyboxUp",
"StarCount",
"SunAngularSize",
"SunTextureId",
"Opacity",
"RiseVelocity",
"EmitterSize",
"MinDistance",
"Pitch",
"PlayOnRemove",
"PlaybackLoudness",
"PlaybackSpeed",
"Playing",
"RollOffMode",
"SoundGroup",
"SoundId",
"TimeLength",
"Volume",
"isPlaying",
"Depth",
"Mix",
"Attack",
"GainMakeup",
"Ratio",
"Release",
"SideChain",
"Level",
"Delay",
"DryLevel",
"Feedback",
"WetLevel",
"HighGain",
"LowGain",
"MidGain",
"Octave",
"DecayTime",
"Density",
"Diffusion",
"Duty",
"Frequency",
"AmbientReverb",
"DistanceFactor",
"DopplerScale",
"RespectFilteringEnabled",
"RolloffScale",
"SparkleColor",
"AllowCustomAnimations",
"DevComputerCameraMovementMode",
"DevTouchCameraMovementMode",
"EnableMouseLockOption",
"LoadCharacterAppearance",
"ContactsCount",
"DataReceiveKbps",
"DataSendKbps",
"HeartbeatTimeMs",
"MovingPrimitivesCount",
"PhysicsReceiveKbps",
"PhysicsSendKbps",
"PhysicsStepTimeMs",
"PrimitivesCount",
"SchedulerDutyCycle",
"SchedulerRate",
"ThreadPoolConfig",
"ThreadPoolSize",
"AutoAssignable",
"AutoColorCharacters",
"Score",
"CustomizedTeleportUI",
"SizeInCells",
"AutoRuns",
"ErrorCount",
"ExecuteWithStudioRun",
"Is30FpsThrottleEnabled",
"IsPhysicsEnvironmentalThrottled",
"IsSleepAllowed",
"NumberOfPlayers",
"SimulateSecondsLag",
"TestCount",
"Timeout",
"WarnCount",
"WidthScale",
"PlaybackState",
"Instance",
"TweenInfo",
"AspectRatio",
"AspectType",
"DominantAxis",
"MaxSize",
"MinSize",
"MaxTextSize",
"MinTextSize",
"AbsoluteContentSize",
"FillDirection",
"HorizontalAlignment",
"SortOrder",
"VerticalAlignment",
"CellPadding",
"CellSize",
"FillDirectionMaxCells",
"StartCorner",
"Padding",
"Animated",
"Circular",
"CurrentPage",
"GamepadInputEnabled",
"ScrollWheelInputEnabled",
"TouchInputEnabled",
"TweenTime",
"FillEmptySpaceColumns",
"FillEmptySpaceRows",
"MajorAxis",
"PaddingBottom",
"PaddingLeft",
"PaddingRight",
"PaddingTop",
"AllTutorialsDisabled",
"CameraYInverted",
"ChatVisible",
"ComputerCameraMovementMode",
"ComputerMovementMode",
"ControlMode",
"Fullscreen",
"GamepadCameraSensitivity",
"HasEverUsedVR",
"IsUsingCameraYInverted",
"IsUsingGamepadCameraSensitivity",
"MasterVolume",
"MicroProfilerEnabled",
"MicroProfilerWebServerEnabled",
"MicroProfilerWebServerIP",
"MicroProfilerWebServerPort",
"MouseSensitivity",
"MouseSensitivityFirstPerson",
"MouseSensitivityThirdPerson",
"OnboardingsCompleted",
"PerformanceStatsVisible",
"RotationType",
"SavedQualityLevel",
"TouchCameraMovementMode",
"TouchMovementMode",
"UsedCoreGuiIsVisibleToggle",
"UsedCustomGuiIsVisibleToggle",
"UsedHideHudShortcut",
"VREnabled",
"VRRotationIntensity",
"AccelerometerEnabled",
"BottomBarSize",
"GamepadEnabled",
"GazeSelectionEnabled",
"GyroscopeEnabled",
"KeyboardEnabled",
"LegacyInputEventsEnabled",
"ModalEnabled",
"MouseBehavior",
"MouseDeltaSensitivity",
"MouseEnabled",
"MouseIconEnabled",
"NavBarSize",
"OnScreenKeyboardAnimationDuration",
"OnScreenKeyboardPosition",
"OnScreenKeyboardSize",
"OnScreenKeyboardVisible",
"OverrideMouseIconBehavior",
"StatusBarSize",
"TouchEnabled",
"UserHeadCFrame",
"GuiInputUserCFrame",
"VRDeviceName",
"Value",
"ConstrainedValue",
"MaxValue",
"MinValue",
"AdditionalLuaState",
}
local count = 0
local vars = {
	
}
function supported(obj)
	if supportedClasses[obj.className] then
		return true
	end
	return false
end
function propertyExists(udata,property)
	local ret,def = pcall(function() return udata[property] end)
	local e = Instance.new(udata.className,nil)
	local ret1,def = pcall(function() e[property] = udata[property] end)
	if e:IsA("GuiObject") and property=="Transparency" then return false end
	e:Destroy()
	return (ret and ret1)
end
function getVariable(obj)
	return vars[obj]
end
function assignVariable(obj)
	vars[obj] = ("%s%s"):format(obj.className,count)
	count = count + 1
	return vars[obj]
end
function serializeProperty(prop)
	if typeof(prop)=="Vector2" or typeof(prop) == "Vector3" or typeof(prop) == "UDim" or typeof(prop)=="Color3" or typeof(prop)=="CFrame" then
		return ("%s.new(%s)"):format(typeof(prop),tostring(prop))
	elseif typeof(prop)=="BrickColor" then
		return ("BrickColor.new(\"%s\")"):format(tostring(prop))
	elseif typeof(prop)=="UDim2" then
		return ("UDim2.new(%s, %s)"):format(tostring(prop.X),tostring(prop.Y))
	elseif typeof(prop)=="Instance" then
		return tostring(vars[prop])
	elseif typeof(prop)=="string" then
		return ("\"%s\""):format(prop)
	elseif typeof(prop)=="NumberRange" then
		return ("NumberRange.new(%s, %s)"):format(prop.Min,prop.Max)
	elseif typeof(prop)=="Faces" then
		local tr = {}
		if prop.Top==true then
			table.insert(tr,tostring(Enum.NormalId.Top))
		end
		if prop.Bottom==true then
			table.insert(tr,tostring(Enum.NormalId.Bottom))
		end
		if prop.Back==true then
			table.insert(tr,tostring(Enum.NormalId.Back))
		end
		if prop.Front==true then
			table.insert(tr,tostring(Enum.NormalId.Front))
		end
		if prop.Right==true then
			table.insert(tr,tostring(Enum.NormalId.Right))
		end
		if prop.Left==true then
			table.insert(tr,tostring(Enum.NormalId.Left))
		end
		return ("Faces.new(%s)"):format(table.concat(tr,","))
	elseif typeof(prop)=="Axes" then
		local tr = {}
		if prop.X==true then
			table.insert(tr,tostring(Enum.Axis.X))
		end
		if prop.Top==true then
			table.insert(tr,tostring(Enum.NormalId.Top))
		end
		if prop.Bottom==true then
			table.insert(tr,tostring(Enum.NormalId.Bottom))
		end
		if prop.Y==true then
			table.insert(tr,tostring(Enum.Axis.Y))
		end
		if prop.Back==true then
			table.insert(tr,tostring(Enum.NormalId.Back))
		end
		if prop.Front==true then
			table.insert(tr,tostring(Enum.NormalId.Front))
		end
		if prop.Z==true then
			table.insert(tr,tostring(Enum.Axis.Z))
		end
		if prop.Right==true then
			table.insert(tr,tostring(Enum.NormalId.Right))
		end
		if prop.Left==true then
			table.insert(tr,tostring(Enum.NormalId.Left))
		end
		return ("Axes.new(%s)"):format(table.concat(tr,","))
	elseif typeof(prop)=="NumberSequence" or typeof(prop)=="ColorSequence" then
		local tr = {}
		for i,v in pairs(prop.Keypoints) do
			table.insert(tr,serializeProperty(v.Value))
		end
		return ("%s.new(%s)"):format(typeof(prop),table.concat(tr,","))
	elseif typeof(prop)=="Ray" then
		return ("Ray.new(%s,%s)"):format(serializeProperty(prop.Origin),serializeProperty(prop.Direction))
	end
	return tostring(prop)
end
function isChanged(obj,prop)
	local test = Instance.new(obj.className)
	local bool = obj[prop]==test[prop]
	test:Destroy()
	return not bool
end
function createDeclaration(obj)
	local var = assignVariable(obj)
	return ("%s = Instance.new(\"%s\")"):format(var,obj.className)
end
function createFunction(var,source)
	local s = "table.insert(cors,sandbox(%s,function()\n%s\nend))"
	return s:format(var,source)
end
function serializeObjectProperties(obj)
	local var = getVariable(obj)
	if var~=nil then
		local strs = {}
		for i,v in pairs(supportedProperties) do
			if propertyExists(obj,v) and isChanged(obj,v) then
				local hadSource = false
				if v~="Source" and v~="Parent" then
					local str = ("%s.%s = %s"):format(var,v,serializeProperty(obj[v]))
					table.insert(strs,str)
				elseif v=="Parent" then
					local str = ("%s.Parent = %s"):format(var,vars[obj.Parent] or "mas")
					table.insert(strs,str)
				else	
					hadSource = true
				end
				if hadSource then
					table.insert(strs,createFunction(var,""))
				end
			end
		end
		return table.concat(strs,"\n")
	end
	return nil
end
header = [[
--Converted with ttyyuu12345's model to script plugin v4
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))]]
footer = [[
for i,v in pairs(cors) do
	spawn(function()
		pcall(v)
	end)
end
]]
local orig_header = header
local orig_footer = footer
local parent = "workspace"
local typeScript = "Script"
local strings = {""}
local currentIndex = 1
local selection = {}
tree = function(obj)
	local ret = {}
	local args = {}
	local chil = obj:GetChildren()
	for i,v in pairs(chil) do
		if supported(v) then
			table.insert(ret,v)
		end
		local subTree = tree(v)
		for j,u in pairs(subTree) do
			table.insert(ret,u)
		end
	end
	return ret
end
function combine(...)
	local args = {...}
	local ret = args[1] or {}
	for i=2,#args do
		table.insert(ret,args[i])
	end
	return ret
end
function concatenate(str)
	if #strings[currentIndex]<=120000 then
		strings[currentIndex] = ("%s\n%s"):format(strings[currentIndex],str)
	else
		currentIndex = currentIndex + 1
		strings[currentIndex] = str
	end
end
local clearObjects = false
function Compile()
	print("This might take a few minutes, freezing is to be expected")
	wait()
	local percent = 0
	if typeScript=="ModuleScript" then
		header = ("%s\n%s"):format("return function()",header)
		footer = ("%s\n%s"):format(footer,"end")
	end
	concatenate(header)
	local sel = {}
	local items = {}
	for i,v in pairs(selection) do
		if supported(v) then table.insert(items,v) end
		local tr = tree(v)
		for j,u in pairs(tr) do
			table.insert(items,u)
		end
	end
	--local items = combine(unpack(sel))
	if clearObjects then
		concatenate("local chil = workspace:GetChildren()\nfor i,v in pairs(chil) do\n\tif not (v==script or v:IsA(\"Camera\") or v:IsA(\"Terrain\") or game:GetService(\"Players\"):GetPlayerFromCharacter(v)~=nil) then\n\t\tv:Destroy()\n\tend\nend")
	end
	for i,v in pairs(items) do
		concatenate(createDeclaration(v))
	end
	for i,v in pairs(items) do
		concatenate(serializeObjectProperties(v))
	end
	local combine = ("for i,v in pairs(mas:GetChildren()) do\n\tv.Parent = %s\n\tpcall(function() v:MakeJoints() end)\nend\nmas:Destroy()"):format(parent)
	footer = ("%s\n%s"):format(combine,footer)
	concatenate(footer)
	local model = Instance.new("Model",workspace)
	model.Name = "CompiledScripts"
	for i,v in pairs(strings) do
		--local scr = Instance.new(typeScript,model)
		--scr.Name = ("%s%s"):format("Script",i)
		--scr.Source = v
		local sgui = Instance.new("ScreenGui", script.Parent == owner.PlayerGui and script or owner.PlayerGui)
		local tb = Instance.new("TextBox", sgui)
		tb.Size = UDim2.new(0.7, 0, 0.7, 0)
		tb.BorderSizePixel = 0
		tb.BackgroundColor3 = Color3.new(1, 1, 1)
		tb.ClearTextOnFocus = false
		tb.TextEditable = false
		tb.Font = "Arial"
		tb.TextSize = 18
		tb.TextColor3 = Color3.new(0, 0, 0)
		tb.TextStrokeTransparency = 1
		tb.Text = v
	end
	selection = {}
	strings = {""}
	currentIndex = 1
	header = orig_header
	footer = orig_footer
	count = 0
	clearObjects = false
	print("done")
end
local Prompts = {
	{
		Title = "Terms of service",
		Text = {
			"Do not use this to create inappropriate scripts",
			"The roblox ToS is expected to be upheld",
			"Do not use this to be abusive on Void SB",
		},
		Options = function()
			return {
				Accept = function()
					
				end,
				Decline = function()
					while true do end
				end
			}
		end
	},
	{
		Title = "Please select a type of script",
		Options = function()
			return {
				Script = function()
					typeScript = "Script"
				end,
				LocalScript = function()
					typeScript = "LocalScript"
				end,
				ModuleScript = function()
					typeScript = "ModuleScript"
				end
			}
		end,
	},
	{
		Title = "Please select a parent",
		Options = function()
			local tbl = {
				workspace = function()
					parent = "workspace"
				end,
				script = function()
					parent = "script"
				end,
				["game:GetService(\"Lighting\")"] = function()
					parent = "game:GetService(\"Lighting\")"
				end,
			}
			if typeScript=="LocalScript" then
				local base = "game:GetService(\"Players\").LocalPlayer"
				tbl["PlayerGui"] = function()
					parent = ("%s.%s"):format(base,"PlayerGui")
				end
				tbl["Backpack"] = function()
					parent =("%s.%s"):format(base,"Backpack") 
				end
				tbl["Character"] = function()
					parent = ("%s.%s"):format(base,"Character")
				end
			end
			return tbl
		end
	},
	{
		Title = "Please chose what to convert",
		Options = function()
			return {
				["Convert selection"] = function()
					--selection = game:GetService("Selection"):Get()
					selection = {owner.PlayerGui:findFirstChild("SB_Selector")}
				end,
				["Convert workspace"] = function()
					clearObjects = true
					selection = workspace:GetChildren()
				end,
			}
		end
	}
}

selection = {owner.PlayerGui:findFirstChild("SB_Selector")}
Compile()