#Requires AutoHotkey v2.0
#SingleInstance

; Send without space
SendRmLast(text) 
{
	SendInput("{Backspace}")
	SendText text
}

; Personal shortcuts
:*:;mail::account@ascyt.com
:*:;website::https://ascyt.com/
:*:;gh::https://github.com/Ascyt/

; Shortcuts for faster writing
:*:;sth::something
:*:;ig::i guess
:*:;idk::i don't know
:*:;idc::i don't care
:*:;wdym::what do you mean
:*:;wby::what about you
:*:;afaik::as far as i know
:*:;iirc::if i remember correctly
:*:;imo::in my opinion

; Stuff that is a pain to spell
:*:;def::definitely
:*:;misc::miscellaneous

; Symbols
:*:;euro::
{
	SendRmLast("€")
}
:*:;pound::
{
    SendRmLast("£")
}
:*:;tm::
{
	SendRmLast("™")
}
:*:;copyright::
{
	SendRmLast("©")
}
:*:;registered::
{
    SendRmLast("®")
}
:*:;pound::
{
    SendRmLast("£")
}
:*:;yen::
{
    SendRmLast("¥")
}
:*:;section::
{
    SendRmLast("§")
}
:*:;degree::
{
    SendRmLast("°")
}
:*:;plusminus::
{
    SendRmLast("±")
}
:*:;micro::
{
    SendRmLast("µ")
}
:*:;not::
{
    SendRmLast("¬")
}
:*:;divide::
{
    SendRmLast("÷")
}
:*:;multiply::
{
    SendRmLast("×")
}
:*:;square::
{
    SendRmLast("²")
}
:*:;cubed::
{
    SendRmLast("³")
}
:*:;sqrt::
{
    SendRmLast("√")
}
:*:;infinity::
{
    SendRmLast("∞")
}   
:*:;integral::
{
    SendRmLast("∫")
}
:*:;approx::
{
    SendRmLast("≈")
}
:*:;neq::
{
    SendRmLast("≠")
}
:*:;leq::
{
    SendRmLast("≤")
}
:*:;geq::
{
    SendRmLast("≥")
}

:*:;alpha::
{
    SendRmLast("α")
}
:*:;beta::
{
    SendRmLast("β")
}
:*:;gamma::
{
    SendRmLast("γ")
}
:*:;delta::
{
    SendRmLast("δ")
}
:*:;pi::
{
    SendRmLast("π")
}

:*:;ellipsis::
{
    SendRmLast("…")
}
:*:;bullet::
{
    SendRmLast("•")
}
:*:;middot::
{
    SendRmLast("·")
}

:*:;check::
{
    SendRmLast("✔")
}
:*:;cross::
{
    SendRmLast("✖")
}
:*:;star::
{
    SendRmLast("★")
}
:*:;ostar::
{
    SendRmLast("☆")
}

:*:;circle::
{
    SendRmLast("○")
}
:*:;altcircle::
{
    SendRmLast("◎")
}
:*:;square::
{
    SendRmLast("■")
}
:*:;osquare::
{
    SendRmLast("□")
}
:*:;otriangle::
{
    SendRmLast("△")
}
:*:;triangle::
{
    SendRmLast("▲")
}
:*:;dotriangle::
{
    SendRmLast("▽")
}
:*:;dtriangle::
{
    SendRmLast("▼")
}
:*:;diamond::
{
    SendRmLast("◆")
}
:*:;odiamond::
{
    SendRmLast("◇")
}
:*:;ohexagon::
{
    SendRmLast("⬡")
}
:*:;hexagon::
{
    SendRmLast("⬢")
}

:*:;larrow::
{
    SendRmLast("←")
}
:*:;rarrow::
{
    SendRmLast("→")
}
:*:;uarrow::
{
    SendRmLast("↑")
}
:*:;darrow::
{
    SendRmLast("↓")
}
:*:;ldoubleangle::
{
    SendRmLast("«")
}
:*:;rdoubleangle::
{
    SendRmLast("»")
}

:*:;zws::
{
	SendRmLast("​")
}
:*:;spanishn::
{
	SendRmLast("ñ")
}
:*:;thorn::
{
    SendRmLast("þ")
}

; Emojis
:*:;skull::
{
	SendRmLast("💀")
}
:*:;nerd::
{
	SendRmLast("🤓")
}
:*:;tu::
{
	SendRmLast("👍")
}
:*:;td::
{
	SendRmLast("👎")
}
:*:;100::
{
    SendRmLast("💯")
}
:*:;shrug::
{
    SendRmLast("¯\_(ツ)_/¯")
}
:*:;shrugmd::
{
    SendRmLast("¯\\_(ツ)_/¯")
}

; Text
:*:;lorem::
{
    SendText "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
}

; System info shorthands
:*:s;date::
{
	Send FormatTime(, "dd.MM.yyyy")
}
:*:s;time::
{
	Send FormatTime(, "HH:mm")
}

Suspense(message) 
{
    SendText message
    Sleep Random(500, 3000)
    SendInput("{Backspace " StrLen(message) "}")

    if Random(0.0, 1.0) < 0.1
    {
        msg := "Shit I fucked up. Trying again..."
        SendText msg
        Sleep Random(1000, 3000)
        SendInput("{Backspace " StrLen(msg) "}")
        Suspense(message)
    }
}

; Random stuff
:*:r;coin::
{
    Suspense "Flipping a coin, please be patient..."

    if Random(0.0, 1.0) < 1.0 / 6000.0
    {
        SendText "it landed on the side???"
        return
    }

	Send Random(0, 1) ? "heads" : "tails"
}
:*:r;8ball::
{
    Suspense "Shaking the magic 8-ball, please be patient..."

    answers := ["It is certain", "It is decidedly so", "Without a doubt", "Yes, definitely", "You may rely on it", "As I see it, yes", "Most likely", "Outlook good", "Yes", "Signs point to yes", "Reply hazy, try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful"]
    SendText answers[Random(1, answers.Length)]
}
:*:r;dice::
{
    Suspense "Rolling a dice, please be patient..."

    values := ["one", "two", "three", "four", "five", "six"]
    Send values[Random(1, 6)]
}
:*:r;xkcd::
{
    SendText "https://xkcd.com/" Random(1, 3000)
}
:*:r;bool::
{
    Send Random(0, 1)
}
:*:r;float::
{
	Send Random(0.0, 1.0)
}
:*:r;int::
{
    Send Random(-2147483648, 2147483647)
}
:*:r;hash::
{
	hash := ""
	Loop 32
	{
		value := Random(0, 15)
		hash .= (value < 10) ? value : Chr(value + 87)
	}
	Send hash
}
:*:r;color::
{
    color := "#"
    Loop 6
    {
        value := Random(0, 15)
        color .= (value < 10) ? value : Chr(value + 87)
    }
    SendText color
}
:*:r;hex::
{
    SendText "0x" Random(0, 0xFFFFFFFF)
}
:*:r;bin::
{
    loop 32
    {
        SendText Random(0, 1)
    }
}
:*:r;ipaddress::
{
    SendText Random(0, 255) "." Random(0, 255) "." Random(0, 255) "." Random(0, 255)
}
:*:r;text::
{
    Loop Random(25, 50)
    {
        SendText Chr(Random(32, 126))
    }
}
:*:r;word::
{
    words := ["ability","access","accident","account","act","action","activity","actor","ad","addition","address","administration","advantage","advertising","advice","affair","age","agency","agreement","air","airport","alcohol","ambition","amount","analysis","analyst","animal","answer","anxiety","apartment","appearance","apple","application","appointment","area","argument","army","arrival","art","article","aspect","assignment","assistance","assistant","association","assumption","atmosphere","attempt","attention","attitude","audience","aunt","average","awareness","back","bad","balance","ball","bank","baseball","basis","basket","bath","bathroom","bedroom","beer","beginning","benefit","bird","birth","birthday","bit","blood","board","boat","body","bonus","book","boss","bottom","box","boy","boyfriend","bread","breath","brother","building","bus","business","buyer","cabinet","camera","cancer","candidate","capital","car","card","care","career","case","cash","cat","category","cause","celebration","cell","championship","chance","chapter","charity","cheek","chemistry","chest","chicken","child","childhood","chocolate","choice","church","cigarette","city","class","classroom","client","climate","clothes","coast","coffee","collection","college","combination","committee","communication","community","company","comparison","competition","complaint","computer","concept","conclusion","condition","confusion","connection","consequence","construction","contact","context","contract","contribution","control","conversation","cookie","country","county","courage","course","cousin","craft","credit","criticism","culture","currency","customer","cycle","dad","data","database","date","day","dealer","death","debt","decision","definition","delivery","demand","department","departure","depression","depth","description","design","desk","development","device","diamond","difference","difficulty","dinner","direction","director","dirt","disaster","discipline","discussion","disease","disk","distribution","dog","drama","drawer","drawing","driver","ear","earth","economics","economy","editor","education","effect","efficiency","effort","egg","election","elevator","emotion","emphasis","employee","employer","employment","end","energy","engine","entertainment","enthusiasm","entry","environment","equipment","error","establishment","estate","event","exam","examination","example","exchange","excitement","exercise","experience","explanation","expression","extent","eye","face","fact","failure","family","farmer","fat","feature","feedback","field","figure","film","finding","fire","fish","flight","focus","food","football","force","form","fortune","foundation","frame","freedom","friendship","fun","funeral","future","game","garbage","garden","gate","gene","gift","girl","girlfriend","goal","government","grandmother","grocery","group","growth","guest","guidance","guide","guitar","hair","half","hall","hand","hat","head","health","hearing","heart","heat","height","highway","historian","history","home","homework","honey","hope","hospital","hotel","house","housing","ice","idea","image","imagination","impact","importance","impression","improvement","income","independence","indication","industry","inflation","information","initiative","injury","insect","inside","inspection","inspector","instance","instruction","insurance","intention","interaction","interest","internet","introduction","investment","issue","item","job","judgment","key","kind","king","knowledge","lab","ladder","lady","lake","language","law","leader","leadership","length","level","library","life","light","line","link","list","literature","location","loss","love","machine","magazine","maintenance","mall","man","management","manager","manufacturer","map","market","marketing","marriage","material","math","matter","meal","meaning","measurement","meat","media","medicine","medium","member","membership","memory","menu","message","metal","method","midnight","mind","mixture","mode","model","mom","moment","money","month","mood","morning","mouse","movie","mud","music","name","nation","nature","negotiation","network","news","newspaper","night","note","nothing","number","object","obligation","office","oil","operation","opinion","opportunity","orange","order","organization","outcome","outside","oven","owner","page","paint","painting","paper","part","passenger","passion","patience","payment","penalty","people","percentage","perception","performance","period","permission","person","personality","perspective","philosophy","phone","photo","physics","piano","picture","pie","piece","pizza","place","plan","platform","player","poem","poet","poetry","point","police","policy","politics","pollution","population","position","possession","possibility","post","pot","potato","power","practice","preference","preparation","presence","presentation","president","pressure","price","priority","problem","procedure","process","product","profession","professor","profit","program","promotion","property","proposal","protection","psychology","purpose","quality","quantity","queen","question","radio","range","rate","ratio","reaction","reality","reason","reception","recipe","recognition","recommendation","record","recording","reflection","refrigerator","region","relation","relationship","replacement","republic","reputation","requirement","research","resolution","resource","response","responsibility","restaurant","result","revenue","review","revolution","risk","river","road","rock","role","room","rule","safety","salad","salt","sample","satisfaction","scale","scene","school","science","screen","secretary","section","sector","security","selection","sense","series","service","session","setting","shape","share","shirt","side","sign","signature","significance","singer","sir","sister","site","situation","size","skill","society","software","soil","solution","son","song","sound","soup","source","space","speaker","speech","sport","square","standard","star","state","statement","steak","step","stock","storage","store","story","stranger","strategy","stress","structure","student","studio","study","style","subject","success","suggestion","sun","supermarket","surgery","sympathy","system","table","tale","task","tax","tea","teacher","technology","television","temperature","tennis","tension","term","test","thanks","theory","thing","thought","throat","time","tongue","tool","tooth","top","topic","town","trade","tradition","trainer","training","transportation","truth","two","type","uncle","understanding","union","unit","university","user","value","variation","variety","vehicle","version","video","view","village","virus","voice","volume","war","warning","water","way","weakness","wealth","weather","web","wedding","week","while","wife","wind","wing","winner","woman","wood","word","work","worker","world","writer","writing","year","youth"]
    SendText words[Random(1, words.Length)]
}

; Commands and system shortcuts
:*:;home::
{
	SendText "%USERPROFILE%/"
}
:*:;docs::
{
	SendText "%USERPROFILE%/Documents/"
}
:*:;pics::
{
	SendText "%USERPROFILE%/Pictures/"
}
:*:;downloads::
{
	SendText "%USERPROFILE%/Downloads/"
}

GitCommitM()
{
	SendText "git commit -m `"`""
	SendInput "{Left}"
}
:*:;gitcm::
{
	GitCommitM()
}
:*:;gitacm::
{
	SendText "git add ."
	SendInput "{Enter}"
	GitCommitM()
}