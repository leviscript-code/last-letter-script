local VIM = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local pgui = player.PlayerGui
local myName = player.Name

-- ========================
--         GUI
-- ========================
local gui = Instance.new("ScreenGui")
gui.Name = "LastLetterBot"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = game:GetService("CoreGui")

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 280, 0, 340)
main.Position = UDim2.new(0, 20, 0.5, -170)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
main.BorderSizePixel = 0
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)
local mainStroke = Instance.new("UIStroke", main)
mainStroke.Color = Color3.fromRGB(88, 101, 242)
mainStroke.Thickness = 2

local dragging, dragStart, startPos
main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)
main.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
main.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
titleBar.BorderSizePixel = 0
titleBar.Parent = main
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 12)

local titleFix = Instance.new("Frame")
titleFix.Size = UDim2.new(1, 0, 0, 12)
titleFix.Position = UDim2.new(0, 0, 1, -12)
titleFix.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
titleFix.BorderSizePixel = 0
titleFix.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -40, 1, 0)
titleText.Position = UDim2.new(0, 12, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "LAST LETTER BOT"
titleText.TextColor3 = Color3.fromRGB(88, 101, 242)
titleText.TextSize = 16
titleText.Font = Enum.Font.GothamBold
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(240, 60, 60)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 14
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BorderSizePixel = 0
closeBtn.Parent = titleBar
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

local content = Instance.new("Frame")
content.Size = UDim2.new(1, -20, 1, -50)
content.Position = UDim2.new(0, 10, 0, 45)
content.BackgroundTransparency = 1
content.Parent = main

local statusDot = Instance.new("Frame")
statusDot.Size = UDim2.new(0, 10, 0, 10)
statusDot.Position = UDim2.new(0, 0, 0, 5)
statusDot.BackgroundColor3 = Color3.fromRGB(240, 60, 60)
statusDot.BorderSizePixel = 0
statusDot.Parent = content
Instance.new("UICorner", statusDot).CornerRadius = UDim.new(1, 0)

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -18, 0, 20)
statusLabel.Position = UDim2.new(0, 18, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "OFFLINE"
statusLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
statusLabel.TextSize = 13
statusLabel.Font = Enum.Font.GothamMedium
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = content

local turnLabel = Instance.new("TextLabel")
turnLabel.Size = UDim2.new(1, 0, 0, 18)
turnLabel.Position = UDim2.new(0, 0, 0, 22)
turnLabel.BackgroundTransparency = 1
turnLabel.Text = ""
turnLabel.TextColor3 = Color3.fromRGB(140, 140, 160)
turnLabel.TextSize = 11
turnLabel.Font = Enum.Font.GothamMedium
turnLabel.TextXAlignment = Enum.TextXAlignment.Left
turnLabel.Parent = content

local wordBox = Instance.new("Frame")
wordBox.Size = UDim2.new(1, 0, 0, 50)
wordBox.Position = UDim2.new(0, 0, 0, 46)
wordBox.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
wordBox.BorderSizePixel = 0
wordBox.Parent = content
Instance.new("UICorner", wordBox).CornerRadius = UDim.new(0, 8)

local prefixLabel = Instance.new("TextLabel")
prefixLabel.Size = UDim2.new(1, -16, 0, 18)
prefixLabel.Position = UDim2.new(0, 8, 0, 4)
prefixLabel.BackgroundTransparency = 1
prefixLabel.Text = "PREFIX"
prefixLabel.TextColor3 = Color3.fromRGB(100, 100, 120)
prefixLabel.TextSize = 11
prefixLabel.Font = Enum.Font.GothamMedium
prefixLabel.TextXAlignment = Enum.TextXAlignment.Left
prefixLabel.Parent = wordBox

local wordLabel = Instance.new("TextLabel")
wordLabel.Size = UDim2.new(1, -16, 0, 22)
wordLabel.Position = UDim2.new(0, 8, 0, 24)
wordLabel.BackgroundTransparency = 1
wordLabel.Text = "---"
wordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
wordLabel.TextSize = 18
wordLabel.Font = Enum.Font.GothamBold
wordLabel.TextXAlignment = Enum.TextXAlignment.Left
wordLabel.Parent = wordBox

local statsBox = Instance.new("Frame")
statsBox.Size = UDim2.new(1, 0, 0, 60)
statsBox.Position = UDim2.new(0, 0, 0, 106)
statsBox.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
statsBox.BorderSizePixel = 0
statsBox.Parent = content
Instance.new("UICorner", statsBox).CornerRadius = UDim.new(0, 8)

local function makeStat(name, x)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.33, 0, 0, 14)
    lbl.Position = UDim2.new(x, 0, 0, 6)
    lbl.BackgroundTransparency = 1
    lbl.Text = name
    lbl.TextColor3 = Color3.fromRGB(100, 100, 120)
    lbl.TextSize = 10
    lbl.Font = Enum.Font.GothamMedium
    lbl.Parent = statsBox
    local val = Instance.new("TextLabel")
    val.Name = name
    val.Size = UDim2.new(0.33, 0, 0, 24)
    val.Position = UDim2.new(x, 0, 0, 22)
    val.BackgroundTransparency = 1
    val.Text = "0"
    val.TextColor3 = Color3.fromRGB(88, 101, 242)
    val.TextSize = 20
    val.Font = Enum.Font.GothamBold
    val.Parent = statsBox
    return val
end

local wordsVal = makeStat("WORDS", 0)
local retriesVal = makeStat("RETRIES", 0.33)
local roundsVal = makeStat("ROUNDS", 0.66)

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(1, 0, 0, 38)
toggleBtn.Position = UDim2.new(0, 0, 0, 176)
toggleBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
toggleBtn.Text = "START"
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.TextSize = 15
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.BorderSizePixel = 0
toggleBtn.Parent = content
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 8)

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, 0, 0, 16)
speedLabel.Position = UDim2.new(0, 0, 0, 222)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "SPEED: NORMAL"
speedLabel.TextColor3 = Color3.fromRGB(100, 100, 120)
speedLabel.TextSize = 11
speedLabel.Font = Enum.Font.GothamMedium
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.Parent = content

local speeds = {{"SLOW", 3}, {"NORMAL", 1.5}, {"FAST", 0.5}}
for i, s in pairs(speeds) do
    local btn = Instance.new("TextButton")
    btn.Name = s[1]
    btn.Size = UDim2.new(0.31, 0, 0, 28)
    btn.Position = UDim2.new((i - 1) * 0.345, 0, 0, 242)
    btn.BackgroundColor3 = s[1] == "NORMAL" and Color3.fromRGB(88, 101, 242) or Color3.fromRGB(38, 38, 50)
    btn.Text = s[1]
    btn.TextColor3 = Color3.fromRGB(200, 200, 210)
    btn.TextSize = 11
    btn.Font = Enum.Font.GothamBold
    btn.BorderSizePixel = 0
    btn.Parent = content
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
end

-- ========================
--       BOT LOGIC
-- ========================
local botActive = false
local baseDelay = 1.5
local totalWords = 0
local totalRetries = 0
local totalRounds = 0

statusLabel.Text = "LOADING DICT..."
statusDot.BackgroundColor3 = Color3.fromRGB(240, 180, 40)

-- dizionario di parole comuni inglesi
local commonWords = {
    "about","above","abuse","acid","across","act","action","active","add","admit",
    "adult","advice","after","again","against","age","agency","agent","agree","ahead",
    "air","alarm","album","alert","alien","alive","allow","alone","along","already",
    "also","alter","always","amount","anchor","anger","angle","angry","animal","annual",
    "answer","any","apart","apple","apply","area","argue","arise","army","around",
    "arrive","arrow","artist","aside","assume","atom","attack","attempt","aunt","author",
    "avoid","awake","award","aware","awful","baby","back","bacon","badge","badly",
    "bag","bake","balance","ball","ban","band","bang","bank","bar","bare",
    "barn","base","basic","basket","bath","battle","beach","bean","bear","beard",
    "beat","beauty","become","bed","beef","been","beer","before","begin","behind",
    "being","believe","bell","belong","below","belt","bench","bend","best","better",
    "beyond","bible","bicycle","big","bike","bill","bind","bird","birth","bite",
    "bitter","black","blade","blame","blank","blast","blaze","bleed","blend","bless",
    "blind","block","blood","blow","blue","board","boat","body","bolt","bomb",
    "bond","bone","book","boot","border","born","boss","both","bother","bottle",
    "bottom","bound","bowl","brain","branch","brand","brave","bread","break","breath",
    "breed","brick","bridge","brief","bright","bring","broad","broken","brother","brown",
    "brush","buck","budget","bug","build","bullet","bunch","burden","burn","burst",
    "bury","bush","busy","butter","button","buyer","cabin","cable","cake","call",
    "calm","came","camera","camp","campaign","cancel","cancer","candle","candy","capital",
    "captain","capture","carbon","card","care","career","carpet","carry","case","cash",
    "cast","castle","catch","category","cattle","cause","ceiling","cell","center","central",
    "certain","chain","chair","challenge","chamber","champion","chance","change","channel","chapter",
    "charge","chart","chase","cheap","check","cheese","cherry","chest","chicken","chief",
    "child","chip","choice","choose","church","circle","citizen","city","civil","claim",
    "class","classic","clean","clear","client","climb","clinical","clock","clone","close",
    "closet","cloth","cloud","club","clue","cluster","coach","coal","coast","coat",
    "code","coffee","cold","collar","collect","college","colony","color","column","combine",
    "come","comfort","command","comment","commit","common","community","company","compare","compete",
    "complain","complete","complex","computer","concern","condition","conduct","confirm","conflict","congress",
    "connect","consider","consist","constant","construct","consume","contact","contain","content","contest",
    "context","continue","contract","control","convert","convince","cook","cookie","cool","cope",
    "copy","core","corn","corner","correct","cost","cotton","couch","could","council",
    "count","counter","country","county","couple","courage","course","court","cousin","cover",
    "crack","craft","crash","crazy","cream","create","creature","credit","crew","crime",
    "criminal","crisis","criteria","critic","crop","cross","crowd","crucial","crush","crystal",
    "culture","cup","cure","curious","current","curve","custom","customer","cute","cycle",
    "dad","daily","damage","dance","danger","dare","dark","data","date","daughter",
    "dawn","dead","deal","dear","death","debate","debt","decade","decent","decide",
    "decision","deck","declare","decline","deep","deer","defeat","defend","define","degree",
    "delay","deliver","demand","democracy","deny","depart","depend","deposit","depth","deputy",
    "derive","describe","desert","design","desire","desk","detail","detect","develop","device",
    "devote","diamond","differ","diet","dig","digital","dinner","direct","dirt","dirty",
    "disable","discover","dish","dismiss","display","distance","distant","distinct","divide","doctor",
    "document","dollar","domain","domestic","door","double","doubt","down","draft","drag",
    "drain","drama","draw","dream","dress","drift","drink","drive","drop","drug",
    "dry","duck","dumb","dump","dust","duty","each","eager","ear","early",
    "earn","earth","ease","east","eastern","easy","eat","edge","edition","editor",
    "educate","effect","effort","eight","either","elder","elect","electric","element","elite",
    "else","embrace","emerge","emotion","emphasis","empire","employ","empty","enable","encounter",
    "encourage","enemy","energy","enforce","engage","engine","enjoy","enormous","enough","ensure",
    "enter","entire","entry","envelope","equal","equip","error","escape","essay","essential",
    "estate","estimate","ethnic","evaluate","even","evening","event","ever","every","evidence",
    "evil","exact","exam","example","exceed","excellent","except","exchange","excite","excuse",
    "execute","exercise","exhibit","exist","expand","expect","expense","expert","explain","explode",
    "explore","export","expose","extend","extent","extra","extreme","eye","fabric","face",
    "fact","factor","factory","fail","fair","faith","fall","false","familiar","family",
    "famous","fan","fancy","fantasy","farm","farmer","fashion","fast","fat","fate",
    "father","fault","favor","fear","feature","federal","feed","feel","female","fence",
    "fever","few","fiber","fiction","field","fifth","fifty","fight","figure","file",
    "fill","film","final","finance","find","fine","finger","finish","fire","firm",
    "first","fish","fit","five","fix","flag","flame","flash","flat","flavor",
    "flee","flesh","flight","flip","float","flood","floor","flow","flower","fluid",
    "fly","focus","fold","folk","follow","food","fool","foot","force","foreign",
    "forest","forever","forget","forgive","fork","form","formal","former","formula","forth",
    "fortune","forward","found","foundation","founder","four","frame","free","freedom","french",
    "frequent","fresh","friend","front","frozen","fruit","fuel","full","fun","function",
    "fund","funny","future","gain","galaxy","game","gang","gap","garage","garden",
    "garlic","gas","gate","gather","gave","gear","gender","general","generate","genetic",
    "gentle","genuine","gesture","ghost","giant","gift","girl","give","glad","glance",
    "glass","global","glory","glove","goal","golden","golf","gone","good","govern",
    "grab","grace","grade","grain","grand","grant","grass","grave","gray","great",
    "green","greet","ground","group","grow","growth","guard","guess","guest","guide",
    "guilt","guitar","gun","habit","hair","half","hall","hand","handle","hang",
    "happen","happy","harbor","hard","harm","hat","hate","have","head","health",
    "hear","heart","heat","heavy","height","help","hence","hero","hide","high",
    "highlight","hill","hint","hire","history","hold","hole","holiday","holy","home",
    "honest","honor","hope","horizon","horror","horse","host","hostile","hotel","hour",
    "house","household","housing","huge","human","humor","hundred","hunger","hunt","hurry",
    "hurt","husband","ice","idea","ideal","identify","ignore","ill","illegal","image",
    "imagine","impact","implement","imply","import","impose","improve","incident","include","income",
    "increase","indeed","index","indicate","individual","indoor","industry","infant","inform","initial",
    "injury","inner","innocent","input","inquiry","insect","insert","inside","insist","install",
    "instance","instant","instead","intend","interest","internal","internet","interview","into","invade",
    "invest","iron","island","isolate","issue","item","itself","jacket","jail","james",
    "jane","jar","jet","jewish","job","john","join","joint","joke","journal",
    "journey","joy","judge","judgment","juice","jump","junior","jury","just","justice",
    "justify","keen","keep","key","kick","kid","kill","kind","king","kiss",
    "kit","kitchen","knee","knew","knife","knock","know","knowledge","label","labor",
    "lack","lady","lake","land","landscape","language","laptop","large","laser","last",
    "late","later","latin","latter","laugh","launch","lawn","lawyer","layer","lead",
    "leader","leaf","league","lean","learn","least","leather","leave","left","legal",
    "lemon","length","lesson","letter","level","liberal","liberty","library","license","life",
    "lift","light","like","likely","limit","line","link","lion","lip","list",
    "listen","little","live","load","loan","lobby","local","lock","long","look",
    "lord","lose","loss","lost","loud","love","lovely","lover","low","lower",
    "luck","lunch","lung","machine","mad","magic","mail","main","maintain","major",
    "majority","make","male","mall","manage","manner","many","map","march","margin",
    "mark","market","marriage","marry","mask","mass","master","match","mate","material",
    "math","matter","maximum","maybe","mayor","meal","mean","meaning","measure","meat",
    "media","medical","medicine","medium","meet","member","memory","mental","mention","menu",
    "mercy","mere","mess","message","metal","method","middle","might","military","milk",
    "million","mind","mine","minister","minor","minority","minute","miracle","mirror","miss",
    "mission","mistake","mix","model","moderate","modern","modest","moment","money","monitor",
    "month","mood","moon","moral","morning","mortgage","most","mother","motion","motor",
    "mount","mountain","mouse","mouth","move","movement","movie","much","murder","muscle",
    "museum","music","must","mutual","myself","mystery","myth","naked","name","narrow",
    "nation","national","native","natural","nature","near","nearly","neat","necessary","neck",
    "need","negative","negotiate","neighbor","neither","nerve","nest","net","network","never",
    "new","news","next","nice","night","nine","noble","nobody","nod","noise",
    "none","normal","north","northern","nose","note","nothing","notice","notion","novel",
    "now","nowhere","nuclear","number","nurse","object","observe","obtain","obvious","occur",
    "ocean","odd","offense","offensive","offer","office","officer","official","often","oil",
    "okay","old","once","one","ongoing","onion","online","only","onto","open",
    "operate","opinion","opponent","opportunity","oppose","option","orange","order","ordinary","organic",
    "origin","other","otherwise","ought","outcome","outdoor","outer","output","outside","overcome",
    "owner","pace","pack","package","page","paid","pain","paint","pair","palace",
    "pale","palm","pan","panel","panic","paper","parent","park","parking","part",
    "partly","partner","party","pass","passage","passion","past","patch","path","patient",
    "pattern","pause","peace","peak","peer","penalty","pension","people","pepper","percent",
    "perfect","perform","perhaps","period","permit","person","personal","pet","phase","phone",
    "photo","phrase","physical","piano","pick","picture","piece","pilot","pine","pink",
    "pipe","pitch","pizza","place","plain","plan","plane","planet","plant","plastic",
    "plate","platform","play","player","please","pleasure","plenty","plot","plug","plus",
    "pocket","poem","poet","poetry","point","poison","pole","police","policy","politics",
    "poll","pool","poor","pop","popular","population","pork","port","portrait","position",
    "positive","possible","post","pot","potato","potential","pound","pour","poverty","powder",
    "power","powerful","practice","pray","prayer","predict","prefer","pregnant","prepare","presence",
    "present","preserve","president","press","pressure","pretend","pretty","prevent","previous","price",
    "pride","priest","primary","prince","princess","principle","print","prior","priority","prison",
    "prisoner","privacy","private","prize","probably","problem","proceed","process","produce","product",
    "production","profession","professor","profile","profit","program","progress","project","promise","promote",
    "proof","proper","property","proposal","propose","prospect","protect","protein","protest","proud",
    "prove","provide","province","public","pull","pump","punch","punish","purchase","pure",
    "purple","purpose","pursue","push","qualify","quality","quarter","queen","question","quick",
    "quiet","quit","quite","quote","race","racial","racism","radical","radio","rage",
    "rain","raise","range","rank","rapid","rare","rate","rather","ratio","raw",
    "reach","react","read","reader","ready","real","realistic","reality","realize","really",
    "reason","rebel","recall","receive","recent","recognize","recommend","record","recover","recruit",
    "reduce","refer","reflect","reform","refuse","regard","regime","region","register","regret",
    "regular","reject","relate","relation","release","relevant","relief","religion","rely","remain",
    "remark","remember","remind","remote","remove","repeat","replace","reply","report","represent",
    "republic","reputation","request","require","research","resist","resolve","resource","respond","response",
    "rest","restaurant","restore","result","retain","retire","return","reveal","revenue","review",
    "revolution","rhythm","rice","rich","ride","rifle","right","ring","riot","rise",
    "risk","river","road","robot","rock","role","roll","roman","romantic","roof",
    "room","root","rope","rose","rough","round","route","routine","row","royal",
    "ruin","rule","run","rural","rush","sacred","sacrifice","sad","safe","safety",
    "sail","sake","salad","salary","sale","salt","same","sample","sand","satellite",
    "satisfy","sauce","save","scale","scared","scene","schedule","scheme","scholar","school",
    "science","scientist","scope","score","screen","sea","search","season","seat","second",
    "secret","section","sector","secure","seed","seek","seem","segment","seize","select",
    "self","sell","senate","send","senior","sense","sentence","separate","sequence","series",
    "serious","serve","service","session","settle","seven","several","severe","shade","shadow",
    "shake","shall","shame","shape","share","sharp","shed","sheer","sheet","shelf",
    "shell","shelter","shift","shine","ship","shirt","shock","shoe","shoot","shop",
    "shore","short","shot","should","shoulder","shout","show","shower","shut","sick",
    "side","sight","sign","signal","silence","silent","silk","silly","silver","similar",
    "simple","since","sing","singer","single","sink","sister","site","situation","six",
    "size","ski","skill","skin","sky","slave","sleep","slice","slide","slight",
    "slip","slow","small","smart","smell","smile","smoke","smooth","snap","snow",
    "social","society","soft","software","soil","solar","soldier","solid","solution","solve",
    "some","somebody","somehow","someone","something","sometimes","somewhat","somewhere","son","song",
    "soon","sorry","sort","soul","sound","source","south","southern","space","speak",
    "speaker","special","specific","speech","speed","spend","sphere","spin","spirit","split",
    "spokesman","sport","spot","spread","spring","square","squeeze","stable","staff","stage",
    "stake","stand","standard","star","stare","start","state","statement","station","status",
    "stay","steady","steal","steam","steel","stem","step","stick","stiff","still",
    "stock","stomach","stone","stop","store","storm","story","straight","strange","stranger",
    "strategic","strategy","stream","street","strength","stress","stretch","strike","string","strip",
    "stroke","strong","structure","struggle","student","studio","study","stuff","stupid","style",
    "subject","submit","succeed","success","such","sudden","suffer","sugar","suggest","suit",
    "summer","summit","sunday","super","supply","support","suppose","sure","surface","surgery",
    "surprise","surround","survey","survive","suspect","suspend","swallow","swear","sweet","swim",
    "swing","switch","symbol","sympathy","system","table","tackle","tail","take","tale",
    "talent","talk","tall","tank","tape","target","task","taste","taught","teach",
    "teacher","team","tear","technology","telephone","television","tell","temperature","temporary","tend",
    "tenant","tension","term","terms","terrible","territory","terror","test","testify","text",
    "thank","theme","then","theory","therapy","there","thick","thin","thing","think",
    "third","thirty","this","those","though","thought","thousand","threat","three","throat",
    "through","throw","thus","ticket","tide","tight","till","timber","time","tiny",
    "tired","tissue","title","tobacco","today","together","toll","tone","tongue","tonight",
    "tool","tooth","topic","total","touch","tough","tour","tourist","toward","tower",
    "town","trace","track","trade","tradition","traffic","trail","train","training","transfer",
    "transform","transition","translate","travel","treat","treatment","treaty","tree","trend","trial",
    "tribe","trick","trigger","trip","triumph","troop","trouble","truck","truly","trust",
    "truth","tune","tunnel","turn","twice","twin","twist","type","typical","ugly",
    "ultimate","unable","uncle","under","undergo","understand","union","unique","unit","united",
    "universe","university","unknown","unless","unlike","unlikely","until","unusual","upper","upset",
    "urban","urge","used","useful","user","usual","usually","valley","valuable","value",
    "van","variety","various","vast","vehicle","venture","version","versus","very","vessel",
    "veteran","victim","victory","video","view","village","violate","violence","virtual","virtue",
    "visible","vision","visit","visitor","visual","vital","voice","volume","voluntary","vote",
    "vulnerable","wage","wait","wake","walk","wall","wander","want","warn","wash",
    "waste","watch","water","wave","weapon","wear","weather","web","website","wedding",
    "week","weekend","weigh","weight","welcome","welfare","well","west","western","wet",
    "what","wheat","wheel","when","where","while","whisper","white","whole","whom",
    "wide","widely","wife","wild","will","willing","wind","window","wine","wing",
    "winner","winter","wire","wisdom","wise","wish","withdraw","within","without","witness",
    "woman","wonder","wood","wooden","word","work","worker","world","worried","worry",
    "worse","worst","worth","would","wound","wrap","write","writer","wrong","yard",
    "yeah","year","yell","yellow","yes","yesterday","yield","young","yours","youth",
    "zone","zero"
}

-- indicizza per prefisso
local byPrefix = {}
for _, w in pairs(commonWords) do
    for len = 1, math.min(4, #w) do
        local pre = string.sub(w, 1, len)
        if not byPrefix[pre] then
            byPrefix[pre] = {}
        end
        table.insert(byPrefix[pre], w)
    end
end

statusLabel.Text = "READY (" .. #commonWords .. " words)"
statusDot.BackgroundColor3 = Color3.fromRGB(60, 180, 75)

local usedInMatch = {}
local triedThisTurn = {}
local wasMatchResults = false

local function isMatchOver()
    local ok, result = pcall(function()
        return pgui.MatchResults.Frame.Visible
    end)
    return ok and result
end

local function isMyTurn()
    local ok, result = pcall(function()
        return string.find(pgui.InGame.Frame.Type.Text:lower(), myName:lower()) ~= nil
    end)
    return ok and result
end

local function getLetters()
    local ok, result = pcall(function()
        local frame = pgui.InGame.Frame.CurrentWord
        local letters = {}
        local i = 1
        while true do
            local slot = frame:FindFirstChild(tostring(i))
            if not slot then break end
            local lbl = slot:FindFirstChild("Letter")
            if lbl and lbl.Text and lbl.Text ~= "..." and lbl.Text ~= "" then
                table.insert(letters, lbl.Text)
            else
                break
            end
            i = i + 1
        end
        return table.concat(letters):lower()
    end)
    return ok and result or ""
end

local function getWord(prefix)
    if not byPrefix[prefix] then return nil end
    for _, w in pairs(byPrefix[prefix]) do
        if not usedInMatch[w] and not triedThisTurn[w] then
            triedThisTurn[w] = true
            return w
        end
    end
    return nil
end

local function humanDelay()
    task.wait(baseDelay + math.random() * (baseDelay * 0.8))
end

local function pressKey(keyCode)
    VIM:SendKeyEvent(true, keyCode, false, game)
    task.wait(0.03)
    VIM:SendKeyEvent(false, keyCode, false, game)
end

local function typeWord(word, prefixLen)
    for i = prefixLen + 1, #word do
        local char = string.sub(word, i, i)
        pressKey(Enum.KeyCode[string.upper(char)])
        task.wait(0.06 + math.random() * 0.12)
    end
    task.wait(0.2 + math.random() * 0.4)
    pressKey(Enum.KeyCode.Return)
end

local function clearAll(count)
    for i = 1, count do
        pressKey(Enum.KeyCode.Backspace)
        task.wait(0.04)
    end
end

local function isInGame()
    local ok, result = pcall(function()
        return pgui.InGame.Frame.Visible
    end)
    return ok and result
end

local function joinMatch()
    pcall(function()
        local dm = pgui:FindFirstChild("DisplayMatch")
        if not dm then return end
        local matches = dm.Frame:FindFirstChild("Matches")
        if not matches then return end
        for _, match in pairs(matches:GetChildren()) do
            if match:IsA("TextButton") then
                local title = match:FindFirstChild("Title")
                if title and string.find(title.Text, "Last Letter") then
                    local pls = match:FindFirstChild("Players")
                    if pls then
                        for _, slot in pairs(pls:GetChildren()) do
                            local dots = slot:FindFirstChild("Dots")
                            if dots and dots.Text == "..." then
                                for _, conn in pairs(getconnections(match.MouseButton1Click)) do
                                    conn:Fire()
                                end
                                return
                            end
                        end
                    end
                end
            end
        end
    end)
end

-- gui events
toggleBtn.MouseButton1Click:Connect(function()
    botActive = not botActive
    if botActive then
        toggleBtn.Text = "STOP"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(240, 60, 60)
        statusLabel.Text = "ACTIVE"
        statusDot.BackgroundColor3 = Color3.fromRGB(60, 240, 75)
    else
        toggleBtn.Text = "START"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        statusLabel.Text = "PAUSED"
        statusDot.BackgroundColor3 = Color3.fromRGB(240, 180, 40)
    end
end)

for _, btn in pairs(content:GetChildren()) do
    if btn:IsA("TextButton") and (btn.Name == "SLOW" or btn.Name == "NORMAL" or btn.Name == "FAST") then
        btn.MouseButton1Click:Connect(function()
            for _, b in pairs(content:GetChildren()) do
                if b:IsA("TextButton") and (b.Name == "SLOW" or b.Name == "NORMAL" or b.Name == "FAST") then
                    b.BackgroundColor3 = Color3.fromRGB(38, 38, 50)
                end
            end
            btn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
            for _, s in pairs(speeds) do
                if s[1] == btn.Name then
                    baseDelay = s[2]
                    speedLabel.Text = "SPEED: " .. btn.Name
                end
            end
        end)
    end
end

closeBtn.MouseButton1Click:Connect(function()
    botActive = false
    gui:Destroy()
end)

-- ========================
--       MAIN LOOP
-- ========================
while task.wait(0.3) do
    if not botActive then continue end

    -- check fine match → resetta parole usate
    if isMatchOver() then
        if not wasMatchResults then
            wasMatchResults = true
            usedInMatch = {}
            wordLabel.Text = "MATCH OVER"
            statusLabel.Text = "MATCH ENDED"
            statusDot.BackgroundColor3 = Color3.fromRGB(240, 180, 40)
        end
        continue
    else
        wasMatchResults = false
    end

    if isInGame() then
        if isMyTurn() then
            statusLabel.Text = "MY TURN"
            statusDot.BackgroundColor3 = Color3.fromRGB(60, 240, 75)
            turnLabel.Text = "Playing..."
            turnLabel.TextColor3 = Color3.fromRGB(60, 240, 75)

            local prefix = getLetters()
            if prefix == "" then continue end

            triedThisTurn = {}
            totalRounds = totalRounds + 1
            roundsVal.Text = tostring(totalRounds)
            prefixLabel.Text = "PREFIX: " .. string.upper(prefix)

            local attempts = 0
            while isMyTurn() and attempts < 8 do
                attempts = attempts + 1

                local word = getWord(prefix)
                if not word then
                    wordLabel.Text = "NO WORDS LEFT"
                    break
                end

                if attempts == 1 then
                    wordLabel.Text = string.upper(word)
                    humanDelay()
                else
                    totalRetries = totalRetries + 1
                    retriesVal.Text = tostring(totalRetries)
                    wordLabel.Text = string.upper(word) .. " (retry " .. (attempts - 1) .. ")"
                    task.wait(0.4 + math.random() * 0.6)
                end

                typeWord(word, #prefix)
                totalWords = totalWords + 1
                wordsVal.Text = tostring(totalWords)

                task.wait(1.2)

                if not isMyTurn() then
                    -- accettata — segna come usata nel match
                    usedInMatch[word] = true
                    wordLabel.Text = string.upper(word) .. " OK"
                    break
                end

                -- rifiutata — cancella tutto e riprova
                clearAll(#word - #prefix)
                task.wait(0.3)
            end
        else
            statusLabel.Text = "WAITING"
            statusDot.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
            pcall(function()
                local otherName = string.match(pgui.InGame.Frame.Type.Text, "^(.+),")
                turnLabel.Text = "Turn: " .. (otherName or "?")
                turnLabel.TextColor3 = Color3.fromRGB(140, 140, 160)
            end)
        end
    else
        statusLabel.Text = "SEARCHING MATCH..."
        statusDot.BackgroundColor3 = Color3.fromRGB(240, 180, 40)
        turnLabel.Text = ""
        joinMatch()
        task.wait(2)
    end
end
