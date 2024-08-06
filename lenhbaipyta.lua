IL("TITLE");
IncludeLib("ITEM");
IncludeLib("TIMER");
IncludeLib("FILESYS");
IncludeLib("SETTING");
IncludeLib("TASKSYS")
IncludeLib("PARTNER");
IncludeLib("BATTLE");
IncludeLib("RELAYLADDER");
IncludeLib("TONG");
IncludeLib("LEAGUE");
Include("\\script\\task\\system\\task_string.lua" );
Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\global\\fuyuan.lua");
Include("\\script\\global\\translife.lua");
Include("\\script\\global\\fantasygoldequip\\fantasygoldequip_npc.lua");
Include("\\script\\global\\gm\\lib_data_table.lua");
Include("\\script\\global\\gm\\lib_data_table_filelua.lua");
Include("\\script\\lib\\remoteexc.lua");
Include("\\script\\lib\\common.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\lib\\log.lua");
Include("\\script\\activitysys\\playerfunlib.lua");
Include("\\script\\misc\\eventsys\\type\\npc.lua");
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\dailogsys\\g_dialog.lua");
Include("\\script\\activitysys\\functionlib.lua");
Include("\\script\\activitysys\\npcdailog.lua");
Include("\\script\\global\\特殊用地\\梦境\\npc\\路人_叛僧.lua"); -- t葃 t駓, c閚g 甶觤 nhanh
Include("\\script\\global\\gm\\ex_lib_head.lua");      --l蕐 trang b?Include("\\script\\global\\gm\\functions_points.lua"); -- l蕐 c竎 lo筰 甶觤
Include("\\script\\global\\gm\\functions_goldplatiumitems.lua"); -- l蕐 item ho祅g kim, b筩h kim
Include("\\script\\global\\thinh\\hotro\\functions_partner.lua"); --b筺 ng h祅h

----------https://youtube.com/c/PYTAGAMING--------------
TITLEDIALOG = "T猲 nh﹏ v藅 : <color=green>%s<color>\n".."T猲 t礽 kho秐: <color=green>%s<color>\n".."T鋋        : <color=green>%d, %d/%d<color>"

function main()
	dofile("script/global/gm/lenhbaitestserver_old.lua")
		local strFaction = GetFaction()
		local nW,nX,nY = GetWorldPos();
		local tbSay = {format(TITLEDIALOG, GetName(), GetAccount() ,nW,nX,nY)};
			tinsert(tbSay, "Nh薾 Point/CacLoaiDiem");
                        tinsert(tbSay, "T葃 T駓, C閚g 觤 Nhanh/chose_reset_type");
						--tinsert(tbSay, "L蕐 Trang B?- V藅 Ph萴/laytrangbivatpham");
                        --tinsert(tbSay, "Boss Ho祅g Kim/bosshk1");
                        --tinsert(tbSay, "B筺 уng H祅h/functions_for_partner");
                        --tinsert(tbSay, "Nh薾 Danh Hi謚 Ki誱 Th?chondanhhieu");
                        --tinsert(tbSay, "Th猰 - X鉧 Skill theo ID/LaySkillID");
			tinsert(tbSay, "Thay фi Tr筺g Th竔 (M祏 PK)/trangthai");
			tinsert(tbSay, "S鯽 l鏸 Th莕 H祅h Ph?fixthanhanhphu");
                        tinsert(tbSay, "V鴗 T蕋 C?V藅 Ph萴 Trong T骾/vutallvatpham");
                        tinsert(tbSay, "H駓 V藅 Ph萴/DisposeItem");
			tinsert(tbSay, "Tho竧./no")
		CreateTaskSay(tbSay)
	return 1;
end
----------------------------L蕐 Trang B?- V藅 Ph萴-----------------------
function laytrangbivatpham()
	local nW,nX,nY = GetWorldPos()
	local szIP = GetIP()
        local tbSay = {format(TITLEDIALOG, GetName(), GetAccount() ,nW,nX,nY,szIP)}
        tinsert(tbSay, "L蕐 у T輒/CreateItemPurple")
	--tinsert(tbSay, "L蕐 Full Ng鵤/layngua")	 
	tinsert(tbSay, "L蕐 Phi Phong/layphiphong")
        tinsert(tbSay, "L蕐 Set у Ho祅g Kim, B筩h Kim/chose_type_goldquip")
	tinsert(tbSay, "N﹏g C蕄 у B筩h Kim/nangcacpbachkim")
	tinsert(tbSay, "L蕐 ITEM (MagicScript, Questkey)/LayItem")
        tinsert(tbSay, "L蕐 у Ho祅g Kim (Goldequip)/LayGoldequip")
	tinsert(tbSay, "Quay l筰/main")
        tinsert(tbSay, "Tho竧./no")
	CreateTaskSay(tbSay)
	return 1;
end
--------------------- L蕐 phi phong-------------------------
function layphiphong()
	for i=3465,3490 do
		AddGoldItem(0, i)
	end
end
------------------------------------------N﹏g c蕄  B筩h Kim -----------------------------------
function nangcacpbachkim()
	local szTitle = " Xin ch祇 <color=red>"..GetName().."<color> ! Чi hi謕 mu鑞 s?d鬾g ch鴆 n╪g g?"
	local tbOpt={}
	tinsert(tbOpt, "N﹏g c蕄  Ho祅g kim l猲 B筩h kim c蕄 0/make_bachkim")
	tinsert(tbOpt, "N﹏g c蕄  Ho祅g kim l猲 B筩h kim c蕄 10/make_bachkim_max")
	tinsert(tbOpt, "N﹏g c蕄 trang b?B筩h Kim t鮪g c蕄/up_bachkim")
	tinsert(tbOpt, "Quay l筰/main")
	tinsert(tbOpt, "Tho竧./no")
	Say(szTitle, getn(tbOpt), tbOpt)
end

function make_bachkim()
	GiveItemUI("T筼 trang b?B筩h Kim","N﹏g c蕄 trang b?Ho祅g kim th祅h B筩h kim", "do_upgoldeq_process",1);
end
function do_upgoldeq_process()
	UpgradePlatinaFromGoldItem(GetGiveItemUnit(1))
end

function make_bachkim_max()
	GiveItemUI("T筼 trang b?B筩h Kim","N﹏g c蕄 trang b?B筩h kim Max (+10)", "do_upgoldeq_max",1);
end
function do_upgoldeq_max()
	UpgradePlatinaFromGoldItem(GetGiveItemUnit(1))
	for i=1,10 do
		UpgradePlatinaItem(GetGiveItemUnit(1))
	end
end

function up_bachkim()
	GiveItemUI("N﹏g c蕄 trang b?B筩h kim","B?v祇 trang b?B筩h kim", "upgrade_bachkim_process",1);
end

function upgrade_bachkim_process()
	UpgradePlatinaItem(GetGiveItemUnit(1))
end
-----------------------------L蕐 Ng鵤------------------
function layngua()
	local tbSay  = {"Чi hi謕 mu鑞 l蕐 ng鵤 n祇?"}
	local nName = tbNameResHorse
	local nNum = getn(nName)
	for i = 1, nNum do
		local nHorse = tbNameResHorse[i].szName
		--local nHorse = nName[num].szName
		tinsert(tbSay,""..nHorse.."/layngua1")
	end
	tinsert(tbSay,"Tho竧./no")
	CreateTaskSay(tbSay)
end
function layngua1(num,page)
	local tbSay  = {"Чi hi謕 mu鑞 l蕐 ng鵤 n祇?"}
	local nTable = tbNameResHorse[num+1].szEquip
	local nCount = getn(nTable)
	if page == nill then
		if nCount > 10 then
			for i = 1 , 10 do
				local nHorseName = nTable[i][1]
				local nHorseRes = nTable[i][2]
				local nHorseLevel = nTable[i][3]
				tinsert(tbSay,format(""..nHorseName.." [C蕄 "..nHorseLevel.."]/#addngua(%d,%d)",nHorseRes,nHorseLevel))
			end
			tinsert(tbSay,format("Trang sau/#layngua1(%d,%d)",num,1))
			tinsert(tbSay,"Tho竧./no")
		end
		if nCount <= 10 then
			for i = 1 , nNum do
				local nHorseName = nTable[i][1]
				local nHorseRes = nTable[i][2]
				local nHorseLevel = nTable[i][3]
				tinsert(tbSay,format(""..nHorseName.." [C蕄 "..nHorseLevel.."]/#addngua(%d,%d)",nHorseRes,nHorseLevel))
			end
			tinsert(tbSay,"Tho竧./no")
		end
	end
	if page ~= nil and page>= 0 then
		local nPage = page
		local nNum = nCount - nPage*10 
		if nNum > 10 then
			for i = nPage*10 + 1 , nPage*10+10 do
				local nHorseName = nTable[i][1]
				local nHorseRes = nTable[i][2]
				local nHorseLevel = nTable[i][3]
				tinsert(tbSay,format(""..nHorseName.." [C蕄 "..nHorseLevel.."]/#addngua(%d,%d)",nHorseRes,nHorseLevel))
			end
			if page ~= 0 then
				tinsert(tbSay,format("Trang trc/#layngua1(%d,%d)",num,page-1))
				tinsert(tbSay,format("Trang sau/#layngua1(%d,%d)",num,page+1))
				tinsert(tbSay,"Tho竧./no")
			end
			if page == 0 then
				tinsert(tbSay,format("Trang sau/#layngua1(%d,%d)",num,page+1))
				tinsert(tbSay,"Tho竧./no")
			end
		end
		if nNum <= 10 then
			for i = nPage*10 + 1 , nCount do
				local nHorseName = nTable[i][1]
				local nHorseRes = nTable[i][2]
				local nHorseLevel = nTable[i][3]
				tinsert(tbSay,format(""..nHorseName.." [C蕄 "..nHorseLevel.."]/#addngua(%d,%d)",nHorseRes,nHorseLevel))
			end
			tinsert(tbSay,format("Trang trc/#layngua1(%d,%d)",num,page-1))
			tinsert(tbSay,"Tho竧./no")
		end
	end
	CreateTaskSay(tbSay)
end
function addngua(id,level)
	local nid = id
	local nlevel = level
	AddItem(0,10,id,level,0,0,0)
end
----------------------------V鴗 T蕋 c?v藅 ph萴---------------------------
function vutallvatpham()
	--ThrowAllItem()

	local tbEquip  = GetRoomItems(0)
	for _,v in tbEquip do
		RemoveItemByIndex(v)
	end

	if HaveCommonItem(6,1,1266)<1 then
	tbAwardTemplet:GiveAwardByList({{szName="",tbProp={6,1,1266,1,0},nCount=1,},}, "npctest", 1); 
	end
	if HaveCommonItem(6,1,438)<1 then
	tbAwardTemplet:GiveAwardByList({{szName="",tbProp={6,1,438,1,0},nCount=1,},}, "npctest", 1); 
	end
	if HaveCommonItem(6,1,5132)<1 then
	tbAwardTemplet:GiveAwardByList({{szName="",tbProp={6,1,5132,1,0},nCount=1,},}, "npctest", 1); 
	end

end
----------------------------Nh薾 Danh Hi謚 Ki誱 Th?----------------------
function chondanhhieu()
	local szTitle = "Xin ch祇 <color=yellow>"..GetName().."<color> , xin m阨 ch鋘 Danh Hi謚...!!!"
	local tbOpt =
	{
		{"Uy Ch蕁 C鰑 Ch﹗.", nhandanhhieu,{5001}},
		{"V?L﹎ Ch?T玭.", nhandanhhieu,{5002}},
		{"Nh蕋 Ki誱 Phong Thi猲.", nhandanhhieu,{5003}},
		{"Nh蕋 L璾 Cao Th?", nhandanhhieu,{5004}},
		{"Hi謕 Kh竎h Cu鑙 C飊g Tr猲 Giang H?", nhandanhhieu,{5005}},
		{"Tho竧"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function nhandanhhieu(nIndex)
	Title_AddTitle(nIndex, 1, 4302359);
	Title_ActiveTitle(nIndex);
	SetTask(1122, nIndex);
end
--------------------L蕐 Skill theo ID-------------------
function LaySkillID()
local szTitle = "Xin ch祇  <color=red>"..GetName().."<color>, b筺 mu鑞 nh薾 hay x鉧 skill n祇?"
local tbOpt =
{
	{"Th猰 Skill", g_AskClientStringEx, {"69,20", 0, 256, "ID Skill", {AddSkill, {self}} }}, 
	{"X鉧 Skill", g_AskClientStringEx, {"69", 0, 300, "ID Skill", {DelSkill, {self}} }},
	{"Th猰 Danh S竎h Skill", g_AskClientStringEx, {"69,70", 0, 256, "ID Skill", {AddDSSkill, {self}} }}, 
	{"X鉧 Danh S竎h Skill", g_AskClientStringEx, {"69,70", 0, 256, "ID Skill", {DelDSSkill, {self}} }}, 
	{"Tr?l筰", main},
	{"Tho竧."},
}
CreateNewSayEx(szTitle, tbOpt)
end
function AddDSSkill(szPos)
	local tbPos = lib:Split(szPos, ",")
	local s = tonumber(tbPos[1])
	local e = tonumber(tbPos[2])
	for i=s,e do AddMagic(i,20) end
end 


function DelDSSkill(szPos) 
	local tbPos = lib:Split(szPos, ",")
	local s = tonumber(tbPos[1])
	local e = tonumber(tbPos[2])
     for i=s,e do DelMagic(i) end
end 

function AddSkill(szPos)
	local tbPos = lib:Split(szPos, ",")
	local id = tonumber(tbPos[1])
	local cap = tonumber(tbPos[2])
     AddMagic(id,cap)
end

function DelSkill(szPos) 
	local idskill = tonumber(szPos) 
	DelMagic(idskill) 
end
----------------------L蕐 ITEM--------------------------------
function LayItem()
g_AskClientStringEx("6,1,125,0,0,0",1,9000,"Nh藀 V祇 Item Code:",{TaoItemID})
end

function TaoItemID(szItem)
	local szICode = lib:Split(szItem, ",");
	local n = getn(szICode);
	if (n ~= 1) then
	if (n < 6) then Talk(1, "", format("Sai Item Code. Thi誹 trng y猽 c莡 <color=yellow>%s<color>",n)); return end
	if (n > 7) then Talk(1, "", format("Sai Item Code. Qu?nhi襲 trng d?li謚 <color=yellow>%s<color>",n)); return end
	local itclass = tonumber(szICode[1]);
	local ittype = tonumber(szICode[2]);
	local itid = tonumber(szICode[3]);
	local itlv = tonumber(szICode[4]);
	local itseri = tonumber(szICode[5]);
	local itluck = tonumber(szICode[6]);
	local itmagic = tonumber(szICode[7]);
	if (itlv < 0) then Talk(1, "", format("C蕄  man  kh玭g 頲 th蕄 qu?<color=yellow>%s<color>",itlv)); return end
	--if (itlv > 10) then Talk(1, "", format("Ch?h?tr?n c蕄 10. Hi謓 t筰 nh藀 v祇 <color=yellow>%s<color>",itlv)); return end
	if (itmagic == nil) then itmagic=0; end
	AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
	else
	local EquipId = tonumber(szICode[1]);
	AddGoldItem(0, EquipId);
	end
end

-------------L蕐 у HK------------------------------------------------------------------
function LayGoldequip()
	g_AskClientStringEx("1", 0, 256, "ID GoldItem", {AddDSGold})
end

function AddDSGold(szPos)
       local tbPos = lib:Split(szPos, ",")
       local s = tonumber(tbPos[1])
       AddGoldItem(0,s)
end
-------------------------------L蕐 у T輒 MaxOPt-------------------------------------------
function CreateItemPurple()
	g_AskClientStringEx("0,0,0,10,0,1,2,3,4,5,6", 0, 256, "Item Param", {AddPurple})
end

function AddPurple(szPos)
        local tbPos = lib:Split(szPos, ",")
        local Genre = tonumber(tbPos[1])
	local Detail = tonumber(tbPos[2])
	local Particular = tonumber(tbPos[3])
	local Level = tonumber(tbPos[4])
	local Series = tonumber(tbPos[5])
	local Prop1 = tonumber(tbPos[6])
	local Prop2 = tonumber(tbPos[7])
	local Prop3 = tonumber(tbPos[8])
	local Prop4 = tonumber(tbPos[9])
	local Prop5 = tonumber(tbPos[10])
	local Prop6 = tonumber(tbPos[11])
	--AddItemEx(4,seed,2,Genre,Detail,Particular,Level,Series,0,Prop1,Prop2,Prop3,Prop4,Prop5,Prop6)
	AddQualityItem(2, Genre,Detail,Particular, Level,Series,0,Prop1,Prop2,Prop3,Prop4,Prop5,Prop6)
end
----------------------H駓 v藅 ph萴----------------------------
function DisposeItem()
GiveItemUI("H駓 v藅 ph萴", "Чi hi謕 h穣 c萵 tr鋘g trong vi謈 h駓 v藅 ph萴, v藅 ph萴  h駓 kh玭g th?l蕐 l筰 頲!", "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		local strItem = GetItemName(nItemIndex)
		RemoveItemByIndex(nItemIndex)
		--WriteLog(date("%Y%m%d %H%M%S").."\t".." GM H駓 Item "..GetAccount().."\t"..GetName().."\t".." Hu?item "..strItem)
	end
	Msg2Player("Thao t竎 h駓 v藅 ph萴 th祅h c玭g")
	Talk(1, "", "Thao t竎 th祅h c玭g, xin ki觤 tra l筰!");
end
--------------------------------------------------------------
--			 		S鯽 Th莕 H祅h Ph?					--
--------------------------------------------------------------
function fixthanhanhphu()
	DisabledUseTownP(0)
	Talk(1,"","Tr筺g th竔 s?d鬾g th?a ph?v?th莕 h祅h ph?c馻 Qu?nh﹏ s? tr?v?ban u!")
end
--------------------------------------------------------------
--			 		Thay фi Tr筺g Th竔						--
--------------------------------------------------------------
function trangthai()
local szTitle = "Чi hi謕 mu鑞 i sang tr筺g th竔 n祇?"
local tbOpt =
	{
		"Luy謓 C玭g (Tr緉g)/#set_trangthai(0)",
		"Ch輓h Ph竔 (V祅g)/#set_trangthai(1)",
		"T?Ph竔 (T輒)/#set_trangthai(2)",
		"Trung L藀 (Xanh)/#set_trangthai(3)",
		"S竧 Th?(п)/#set_trangthai(4)",
                                   "GM (H錸g)/#set_trangthai(5)",
		"Tr?l筰/main",
		"Tho竧./no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end
function set_trangthai(nTrangthai)
	SetCurCamp(nTrangthai)
	SetCamp(nTrangthai)
end
--------------------------------------------------------------
--			 			Boss Ho祅g Kim						--
--------------------------------------------------------------
function bosshk1()
		local strFaction = GetFaction()
		local nW,nX,nY = GetWorldPos();
		local tbSay = {format(TITLEDIALOG, GetName(), GetAccount() ,nW,nX,nY)};
			tinsert(tbSay, "G鋓 Boss Ho祅g Kim/Auto_TestBoss");
			tinsert(tbSay, "T譵 Boss Ho祅g Kim/timbosshk");
			tinsert(tbSay, "K誸 th骳 i tho筰./no")
		CreateTaskSay(tbSay)
	return 1;
end
---------------G鋓 Boss HK------------------------
----Youtube/c/PYTAGAMING---------
----HAM TEST GOI BOSS KHU VUC
TBBOSS  = 
{ --t猲 boss,id boss, t?l?r琲 ,series boss,nLevel
        [1]={	szName = "T辬h Th玭g",		        nBossId = 1355,	nRate = 322,	nSeries = 0,	nLevel = 95},
        [2]={	szName = "Ng筼 Thi猲 Tng Qu﹏",	nBossId = 1356,	nRate = 322,	nSeries = 0,	nLevel = 95},
	[3]={	szName = "Li評 Thanh Thanh",		nBossId = 523,	nRate = 322,	nSeries = 1,	nLevel = 95},
	[4]={	szName = "T﹜ Vng T?чc",		nBossId = 1358,	nRate = 322,	nSeries = 1,	nLevel = 95},
        [5]={	szName = "Di謚 Nh?,			nBossId = 513,	nRate = 322,	nSeries = 2,	nLevel = 95},
        [6]={	szName = "Do穘 Thanh V﹏",		nBossId = 1360,	nRate = 322,	nSeries = 2,	nLevel = 95},
        [7]={	szName = "H綾 Y S竧 Th?,		nBossId = 1361,	nRate = 322,	nSeries = 3,	nLevel = 95},
        [8]={	szName = "Th藀 Phng C﹗ Di謙",		nBossId = 1362,	nRate = 322,	nSeries = 3,	nLevel = 95},
        [9]={	szName = "Trng T玭g Ch輓h",		nBossId = 511,	nRate = 322,	nSeries = 4,	nLevel = 95},
        [10]={	szName = "Thanh Y T?,			nBossId = 1364,	nRate = 322,	nSeries = 4,	nLevel = 95},
}

TBBOSS2  = 
{ --t猲 boss,id boss, t?l?r琲 ,series boss,nLevel
        [1]={	szName = "C?B竎h",			nBossId = 566,	nRate = 322,	nSeries = 0,	nLevel = 95},
	[2]={	szName = "Vng T?,			nBossId = 739,	nRate = 322,	nSeries = 0,	nLevel = 95},	
        [3]={	szName = "Huy襫 Gi竎 Чi S?,		nBossId = 740,	nRate = 322,	nSeries = 0,	nLevel = 95},
        [4]={	szName = "Huy襫 Nan Чi S?,		nBossId = 1365,	nRate = 342,	nSeries = 0,	nLevel = 95},
	[5]={	szName = "Л阯g B蕋 Nhi詍",		nBossId = 741,	nRate = 336,	nSeries = 1,	nLevel = 95},
	[6]={	szName = "Л阯g Phi Y課",		nBossId = 1366,	nRate = 342,	nSeries = 1,	nLevel = 95},
        [7]={	szName = "B筩h Doanh Doanh",		nBossId = 742,	nRate = 336,	nSeries = 1,	nLevel = 95},
	[8]={	szName = "Lam Y Y",			nBossId = 582,	nRate = 336,	nSeries = 1,	nLevel = 95},
        [9]={	szName = "Thanh Tuy謙 S?Th竔",		nBossId = 743,	nRate = 341,	nSeries = 2,	nLevel = 95},
	[10]={	szName = "H?Linh Phi猽",		nBossId = 568,	nRate = 336,	nSeries = 2,	nLevel = 95},
	[11]={	szName = "Chung Linh T?,		nBossId = 567,	nRate = 336,	nSeries = 2,	nLevel = 95},
}

TBBOSS22  = 
{ --t猲 boss,id boss, t?l?r琲 ,series boss,nLevel
        [1]={	szName = "Y猲 Hi觰 Tr竔",		nBossId = 744,	nRate = 336,	nSeries = 2,	nLevel = 95},
        [2]={	szName = "H?Nh﹏ Ng?,			nBossId = 745,	nRate = 321,	nSeries = 3,	nLevel = 95},
	[3]={	szName = "M筺h Thng Lng",		nBossId = 583,	nRate = 321,	nSeries = 3,	nLevel = 95},
	[4]={	szName = "筺 M閏 Du?,		nBossId = 565,	nRate = 227,	nSeries = 3,	nLevel = 95},
	[5]={	szName = "Gia Lu藅 T?Ly",		nBossId = 563,	nRate = 227,	nSeries = 3,	nLevel = 95},
        [6]={	szName = "H祅 M玭g",			nBossId = 748,	nRate = 341,	nSeries = 3,	nLevel = 95},
	[7]={	szName = "Кn T?Nam",			nBossId = 746,	nRate = 341,	nSeries = 4,	nLevel = 95},
        [8]={	szName = "Чo Thanh Ch﹏ Nh﹏",		nBossId = 562,	nRate = 341,	nSeries = 4,	nLevel = 95},
	[9]={	szName = "T?Чi Nh筩",			nBossId = 1367,	nRate = 342,	nSeries = 4,	nLevel = 95},	
	[10]={	szName = "Thanh Li猲 T?,		nBossId = 1368,	nRate = 875,	nSeries = 4,	nLevel = 95},
        [11]={	szName = "Tuy襫 C?T?,			nBossId = 747,	nRate = 341,	nSeries = 4,	nLevel = 95},
}


TBBOSSCAONHAN  = 
{ --t猲 boss,id boss, t?l?r琲 ,series boss,nLevel
	[1]={	szName = "Thi誹 L﹎ H?T?V?T╪g",	nBossId = 1194,	nRate = 300,	nSeries = 0,	nLevel = 95},
	[2]={	szName = "Thi猲 Vng Tr蕁 Bang H?V?,	nBossId = 1193,	nRate = 300,	nSeries = 4,	nLevel = 95},
	[3]={	szName = "Dng Gia Trang Hi謕 Kh竎h",	nBossId = 1195,	nRate = 300,	nSeries = 3,	nLevel = 95},
	[4]={	szName = "Ng?чc V?S綾 La S竧",	nBossId = 1196,	nRate = 300,	nSeries = 1,	nLevel = 95},
	[5]={	szName = "Nga Mi Kim жnh S?Th竔",	nBossId = 1197,	nRate = 300,	nSeries = 2,	nLevel = 95},
	[6]={	szName = "Th髖 Y猲 M玭 V?秐h S竧 Th?,	nBossId = 1198,	nRate = 300,	nSeries = 2,	nLevel = 95},
	[7]={	szName = "C竔 Bang Ti猽 Dao Th莕 C竔",	nBossId = 1199,	nRate = 300,	nSeries = 3,	nLevel = 95},
	[8]={	szName = "Thi猲 Nh蒼 H?Gi竜 Th竛h S?,	nBossId = 1200,	nRate = 300,	nSeries = 3,	nLevel = 95},
	[9]={	szName = "V?ng Th竔 蕋 Ch﹏ Qu﹏",	nBossId = 1201,	nRate = 300,	nSeries = 4,	nLevel = 95},
	[10]={	szName = "C玭 L玭 H?Ph竔 Thi猲 Qu﹏",	nBossId = 1202,	nRate = 300,	nSeries = 4,	nLevel = 95},
	[11]={	szName = "Hoa S琻 чc C?Ki誱 Ti猲",	nBossId = 1231,	nRate = 300,	nSeries = 2,	nLevel = 95},
}

TBBOSSCAOCAP  = 
{ --t猲 boss,id boss, t?l?r琲 ,series boss,nLevel
	[1]={	szName = "M?Dung To祅",		nBossId = 1875,	nRate = 300,	nSeries = 2,	nLevel = 95},
	[2]={	szName = "Kim Th?Lng",		nBossId = 1874,	nRate = 300,	nSeries = 0,	nLevel = 95},
	[3]={	szName = "Trng Tuy猲",			nBossId = 1873,	nRate = 300,	nSeries = 3,	nLevel = 95},
}

function Auto_TestBoss()
	tb = {"<color=red>"..GetName().."<color> b筺 mu鑞 th?boss n祇?"}
	for k=1,getn(TBBOSS) do 
		tinsert(tb,format("%s/#PickBoss(%d)",TBBOSS[k].szName,k));
	end	
	tinsert(tb,"Trang sau/Auto_TestBoss2");
	tinsert(tb,"Tho竧/cancel");
	CreateTaskSay(tb)
end
function Auto_TestBoss2()
	tb = {"<color=red>"..GetName().."<color> b筺 mu鑞 th?boss n祇?"}
	for k=1,getn(TBBOSS2) do 
		tinsert(tb,format("%s/#PickBoss2(%d)",TBBOSS2[k].szName,k));
	end	
	tinsert(tb,"Trang sau/Auto_TestBoss22");
	tinsert(tb,"Tho竧/cancel");
	CreateTaskSay(tb)
end
function Auto_TestBoss22()
	tb = {"<color=red>"..GetName().."<color> b筺 mu鑞 th?boss n祇?"}
	for k=1,getn(TBBOSS22) do 
		tinsert(tb,format("%s/#PickBoss22(%d)",TBBOSS22[k].szName,k));
	end	
	tinsert(tb,"Trang sau/Auto_TestBoss3");
	tinsert(tb,"Tho竧/cancel");
	CreateTaskSay(tb)
end

function Auto_TestBoss3()
	tb = {"<color=red>"..GetName().."<color> b筺 mu鑞 th?boss n祇?"}
	for k=1,getn(TBBOSSCAONHAN) do 
		tinsert(tb,format("%s/#PickBoss3(%d)",TBBOSSCAONHAN[k].szName,k));
	end	
	tinsert(tb,"Trang sau/Auto_TestBoss4");
	tinsert(tb,"Tho竧/cancel");
	CreateTaskSay(tb)
end

function Auto_TestBoss4()
	tb = {"<color=red>"..GetName().."<color> b筺 mu鑞 th?boss n祇?"}
	for k=1,getn(TBBOSSCAOCAP) do 
		tinsert(tb,format("%s/#PickBoss4(%d)",TBBOSSCAOCAP[k].szName,k));
	end	
	tinsert(tb,"Tho竧/cancel");
	CreateTaskSay(tb)
end

function PickBoss(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh玭g th?th?boss ?nh鱪g n琲 phi chi課 u 頲.")
		return 
	end
	local item = TBBOSS[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);
	SetNpcDeathScript(index,"\\script\\missions\\boss\\bosstieu.lua")		
	SetNpcParam(index,1,item.nBossId); --l璾 id boss.
	SetNpcTimer(index,120*60*18)
	local W,X,Y = GetWorldPos();
	str = format("<color=yellow>%s<color>  xu蕋 hi謓 t筰 <color=yellow>%s (%d,%d)<color>",item.szName,SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16))
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, str)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function PickBoss2(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh玭g th?th?boss ?nh鱪g n琲 phi chi課 u 頲.")
		return 
	end
	local item = TBBOSS2[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);
	SetNpcDeathScript(index,"\\script\\missions\\boss\\bossdeath.lua")		
	SetNpcParam(index,1,item.nBossId); --l璾 id boss.
	SetNpcTimer(index,120*60*18)
	local W,X,Y = GetWorldPos();
	str = format("<color=yellow>%s<color>  xu蕋 hi謓 t筰 <color=yellow>%s (%d,%d)<color>",item.szName,SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16))
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, str)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function PickBoss22(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh玭g th?th?boss ?nh鱪g n琲 phi chi課 u 頲.")
		return 
	end
	local item = TBBOSS22[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);
	SetNpcDeathScript(index,"\\script\\missions\\boss\\bossdeath.lua")		
	SetNpcParam(index,1,item.nBossId); --l璾 id boss.
	SetNpcTimer(index,120*60*18)
	local W,X,Y = GetWorldPos();
	str = format("<color=yellow>%s<color>  xu蕋 hi謓 t筰 <color=yellow>%s (%d,%d)<color>",item.szName,SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16))
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, str)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function PickBoss3(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh玭g th?th?boss ?nh鱪g n琲 phi chi課 u 頲.")
		return 
	end
	local item = TBBOSSCAONHAN[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);
	SetNpcDeathScript(index,"\\script\\misc\\boss\\callbossdeath.lua")		
	SetNpcParam(index,1,item.nBossId); --l璾 id boss.
	SetNpcTimer(index,120*60*18)
	local W,X,Y = GetWorldPos();
	str = format("<color=yellow>%s<color>  xu蕋 hi謓 t筰 <color=yellow>%s (%d,%d)<color>",item.szName,SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16))
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, str)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end
function PickBoss4(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh玭g th?th?boss ?nh鱪g n琲 phi chi課 u 頲.")
		return 
	end
	local item = TBBOSSCAOCAP[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);		
	SetNpcParam(index,1,item.nBossId); --l璾 id boss.
	SetNpcTimer(index,120*60*18)
	local W,X,Y = GetWorldPos();
	str = format("<color=yellow>%s<color>  xu蕋 hi謓 t筰 <color=yellow>%s (%d,%d)<color>",item.szName,SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16))
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, str)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function cancel()
end
-------------------------T譵 Boss HK-----------------------------------------
tbMapGoldBoss = {
{"C?B竎h","Ph?Dung ng",202,"S琻 B秓 ng",76,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"Huy襫 Gi竎 Чi S?,"Nh筺 Th筩h ng",10,"Thanh kh?ng",198,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"Л阯g Phi Y課", "Phong L╪g ",336,"Kho?Lang ng",75,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"Lam Y Y","V?L╪g ng",199,"Phi Thi猲 ng",204,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"H?Linh Phi猽", "Trng B筩h s琻 B綾",322,"V?Danh ng",203,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"Y猲 Hi觰 Tr竔", "Sa M筩 s琻  ng 1",225,"Sa M筩 s琻  ng 3",227,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"M筺h Thng Lng","Sa m筩 a bi觰",224,"Sa M筩 s琻  ng 2",226,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"Gia Lu藅 T?Ly", "Lng Th駓 ng",181,"Dng Trung ng",205,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"Чo Thanh Ch﹏ Nh﹏","Trng B筩h s琻 Nam",321,"M筩 Cao Qu藅",340,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"Tuy襫 C?T?, "T﹜ S琻 o",342,"Phi Thi猲 ng",204,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"Vng T?,"V?L╪g ng",199,"Ph?Dung ng",202,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"Huy襫 Nan Чi S?,"Phong L╪g ",336,"Kho?Lang ng",75,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"Л阯g B蕋 Nhi詍", "Trng B筩h s琻 Nam",321,"Kho?Lang ng",75,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"B筩h Doanh Doanh", "Thanh kh?ng",198,"Sa m筩 a bi觰",224,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"Thanh Tuy謙 S?Th竔", "T﹜ S琻 o",342,"Dng Trung ng",205,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"Chung Linh T?, "Phi Thi猲 ng",204,"V?Danh ng",203,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"H?Nh﹏ Ng?, "Nh筺 Th筩h ng",10,"Lng Th駓 ng",181,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"an M閏 Du?, "Phong L╪g ",336,"S琻 B秓 ng",76,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"T?Чi Nh筩", "M筩 B綾 Th秓 Nguy猲",341,"V?L╪g ng",199,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"Thanh Li猲 T?,"Trng B筩h s琻 B綾",322,"Sa M筩 s琻  ng 3",227,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"Thanh Tuy謙 S?Th竔","Sa M筩 s琻  ng 1",225,"Sa M筩 s琻  ng 3",227,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
{"H祅 Ngu D鑤","Phong L╪g ",336,"Kho?Lang ng",75,"Tng Dng",78,"Phng Tng",1,"Th祅h Й",11,"Dng Ch﹗",80,"Bi謓 Kinh",37,"Чi L?,162,"L﹎ An",176},
}

function timbosshk()
    findgoldboss(1,12)
end
function findgoldboss(f_bossx,f_bossy)

	if (not f_bossx) then
		f_bossx1 = 1;
		f_bossy1 = 12;
	else
		f_bossx1 = f_bossx;
		f_bossy1 = f_bossy;
	end

	if (f_bossy1 - f_bossx1 > 11) then
		f_bossy1 = f_bossx1 + 11;
	end

	local n_count = getn(tbMapGoldBoss);
	local tab_Content = {}

	for i = f_bossx1, f_bossy1 do
		tinsert(tab_Content, tbMapGoldBoss[i][1].."/#findgoldboss_Step2( "..i..")");
	end
	if (f_bossx1 ~= 1) then
		tinsert(tab_Content, "Trang trc/#findgoldboss( 1,"..(f_bossx1-1)..")");
	end

	if (f_bossy1 < n_count) then
		tinsert(tab_Content, "Trang sau/#findgoldboss( "..(f_bossy1+1)..","..n_count..")");
	end
	tinsert(tab_Content, "Tho竧./no");
	Say("Чi hi謕 t譵 cao th?n祇?", getn(tab_Content), tab_Content);
end
function findgoldboss_Step2(nId)
	local tb = {}
	for i=2,getn(tbMapGoldBoss[nId]),2 do --"buoc nhay 2 tuc la i=2,4,6,8,10
	local npcidxtab = GetMapNpcWithName(tbMapGoldBoss[nId][i+1], tbMapGoldBoss[nId][1])
		if npcidxtab == nil then
				nNPCCount = 0
		else
			nNPCCount = getn(npcidxtab);
		end
		for j = 1, nNPCCount do
			x, y, subworld = GetNpcPos(npcidxtab[j]);
			m,n,k = floor(x/32),floor(y/32),SubWorldIdx2ID(subworld)

			--tinsert(tbOpt, {tbMapGoldBoss[nId][1].."-"..tbMapGoldBoss[nId][i].."["..m.."-"..n.."]",bbbbb, {m,n,k}})
			tinsert(tb,tbMapGoldBoss[nId][1].."-"..tbMapGoldBoss[nId][i].."["..floor(m/8).."-"..floor(n/16).."]/#findgoldboss_Step3("..m..","..n..","..k..")")
		end
	end
	strTittle = "T譵 th蕐 cao th?v?l﹎ "..tbMapGoldBoss[nId][1].." t筰 c竎 v?tr?sau y."
	--tinsert(tbOpt, {"tho竧 ",Quit})
	tinsert(tb,"Quay l筰./#findgoldboss(1,12)")
	tinsert(tb,"Tho竧./Quit")
	--CreateNewSayEx(strTittle, tbOpt)
	Say(strTittle,getn(tb),tb)
end
function findgoldboss_Step3(nX,nY,Map)
	NewWorld(Map,nX,nY) --
	SetFightState(1)
end
--------------------------------------------------------------
--			 T葃 T駓, C閚g 觤 Nhanh							--
--------------------------------------------------------------
function chose_reset_type()
        local nW,nX,nY = GetWorldPos()
	local szIP = GetIP()
        local tbSay = {format(TITLEDIALOG, GetName(), GetAccount() ,nW,nX,nY,szIP)}
        tinsert(tbSay, "T葃 Ti襪 N╪g/DoClearPropCore") 
	tinsert(tbSay, "T葃 K?N╪g/DoClearSkillCore") 
	tinsert(tbSay, "C閚g 觤 Nhanh/add_prop")
	tinsert(tbSay, "Quay l筰/main")
        tinsert(tbSay, "Tho竧./no")
    CreateTaskSay(tbSay)
end
--------------------------------------------------------------
--							Point							--
--------------------------------------------------------------
function CacLoaiDiem()
	local tbSay  = {"Чi hi謕 mu鑞 nh薾 lo筰 甶觤 n祇?"}
		--tinsert(tbSay, "Kinh Nghi謒 (EXP)/kinhnghiem")
		--tinsert(tbSay, "N﹏g C蕄 ч/dangcap200")
		--tinsert(tbSay, "Nh薾 觤 Ti襪 N╪g/pointtiemnang")
		--tinsert(tbSay, "Nh薾 觤 K?N╪g/pointkynang")
        --tinsert(tbSay, "Nh薾 Ti襫 V筺/tien")
		--tinsert(tbSay, "Nh薾 Ti襫 уng/tiendong")
		--tinsert(tbSay, "Nh薾 Kim Nguy猲 B秓/knb")
        --tinsert(tbSay, "Nh薾 Ch﹏ Nguy猲 v?H?M筩h Кn/channguyen")
        --tinsert(tbSay, "Nh薾 Danh V鋘g/danhvong")
		--tinsert(tbSay, "Nh薾 觤 Ph骳 Duy猲/phucduyen")
		tinsert(tbSay, "Nh薾 Full T礽 L穘h Чo/tailanhdao")
		--tinsert(tbSay, "Nh薾 觤 C鑞g Hi課 Bang h閕/conghien")
		tinsert(tbSay, "K誸 th骳 i tho筰./no")
	CreateTaskSay(tbSay)
end
------------Ch﹏ Nguy猲----------------------------
function channguyen()
	SetTask(4000, GetTask(4000) + 12000)	
	for i = 1,12 do
		AddStackItem(500, 6, 1, 3203, 0, 0, 0)
	end
	Msg2Player("B筺 nh薾 頲 <color=yellow>12000<color> Ch﹏ Nguy猲 v?<color=yellow>6000<color> H?M筩h Кn")
end
------------C蕄-------------------
function dangcap200()
AskClientForNumber("level",0,200,"Nh藀 C蕄 ч:")
end

function level(num)
local nCurLevel = GetLevel()
local nAddLevel = num - nCurLevel
ST_LevelUp(nAddLevel)
Msg2Player("B筺 nh薾 頲 <color=yellow>"..num.."<color> c蕄 .")
end
---EXP-----
function kinhnghiem()
AskClientForNumber("kinhnghiem1",0,9999999999999999,"Nh藀 EXP")
end
function kinhnghiem1(nNum)
AddOwnExp(nNum)
Msg2Player("B筺 nh薾 頲 <color=yellow>"..nNum.."<color> kinh nghi謒.")
end
---Tien Van---
function tien()
AskClientForNumber("tienvan",0,10000000,"Nh藀 S?Lng:")
end
function tienvan(slkv)
local money= slkv*10000
local giatrikv=money/10000
Earn(money)
Msg2Player(format("B筺 nh薾 頲 <color=yellow>%s<color> v筺.",giatrikv))
end
---Tien Dong---
function tiendong()
AskClientForNumber("tiendong1",0,1000,"Nh藀 S?Lng:")
end;
function tiendong1(sltiendong)
for i = 1, sltiendong do
AddStackItem(1,4,417,1,1,0,0,0)
end
Msg2Player("B筺 nh薾 頲 <color=yellow>"..sltiendong.."<color> ti襫 ng.")
end
----KNB------
function knb()
AskClientForNumber("layknb",0,100000,"Nh藀 S?Lng:")
end
function layknb(slknb)
for i=1, slknb do
AddEventItem(343)
end
Msg2Player("B筺 nh薾 頲 <color=yellow>"..slknb.."<color> KNB.")
end
----------------觤 K?N╪g----------------------------------------
function pointkynang()
AskClientForNumber("pointkynang1",0,1000,"Nh藀 S?Lng:")
end;
function pointkynang1(nNum)
AddMagicPoint(nNum)		---Nh薾 甶觤 k?n╪g
Msg2Player("B筺 nh薾 頲 <color=yellow>"..nNum.."<color> 甶觤 K?N╪g.")
end
------------------觤 Ti襪 N╪g--------------------------------------
function pointtiemnang()
AskClientForNumber("pointtiemnang1",0,1000000,"Nh藀 S?Lng:")
end;
function pointtiemnang1(nNum)
AddProp(nNum)		---Nh薾 甶觤 ti襪 n╪g
Msg2Player("B筺 nh薾 頲 <color=yellow>"..nNum.."<color> 甶觤 Ti襪 N╪g.")
end
------------Danh V鋘g----------------------------
function danhvong()
AskClientForNumber("danhvongINPUT",0,100000,"Nh藀 S?Lng:")
end
function danhvongINPUT(nNum)
AddRepute(nNum);
Msg2Player("B筺 nh薾 頲 <color=yellow>"..nNum.."<color> 甶觤 Danh V鋘g.")
end
------------Ph骳 Duy猲----------------------------
function phucduyen()
AskClientForNumber("phucduyen2",0,100000,"Nh藀 S?Lng:")
end
function phucduyen2(nNum)
FuYuan_Start();
FuYuan_Add(nNum);
Msg2Player("B筺 nh薾 頲 <color=yellow>"..nNum.."<color> 甶觤 Ph骳 Duy猲.")
end
------------T礽 L穘h Чo----------------------------
function tailanhdao()
	for i = 1, 250 do
		AddLeadExp(1000000000)
	end
	Msg2Player("B筺 nh薾 頲 100 c蕄 t礽 l穘h o");
end
------------觤 C鑞g Hi課----------------------------
function conghien()
	AddContribution(1000000);
	Msg2Player("B筺 nh薾 頲 1.000.000 甶觤 c鑞g hi課")
end