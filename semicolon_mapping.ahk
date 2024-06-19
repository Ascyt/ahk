#Requires AutoHotkey v2.0
#SingleInstance force

RunDialogue(arg)
{
    SendText "{  }"
    SendInput("{Left 2}")

    ArgObj := FileOpen(".\type_shortcut_args.txt", "w")
    ArgObj.Write(arg "`n1")
    ArgObj.Close()

	RunWait "./type_shortcut.exe"

	OutputObj := FileOpen(".\type_shortcut_output.txt", "r")
	Line := OutputObj.Read()
	OutputObj.Close()

    SendInput("{Delete 2}{Backspace 2}")

    return Line
}

; Send without space
SendRmLast(txt) 
{
	SendInput("{Backspace}")
	SendText txt
}

; Personal shortcuts
:*:;mail::account@ascyt.com
:*:;website::https://ascyt.com/
:*:;gh::https://github.com/Ascyt/
:*:;img::https://img.ascyt.com/assets/

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
:*:doublerarrow::
{
    SendRmLast("⇒")
}
:*:doublelarrow::
{
    SendRmLast("⇐")
}
:*:doubleuarrow::
{
    SendRmLast("⇑")
}
:*:doubledarrow::
{
    SendRmLast("⇓")
}
:*:;lrarrow::
{
    SendRmLast("↔")
}
:*:;udarrow::
{
    SendRmLast("↕")
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
:*:;thornup::
{
    SendRmLast("Þ")
}

; Emojis
:*:;skull::
{
	SendRmLast("💀")
}
:*:;nerd::
{
	SendRmLast("🤓☝️")
}
:*:;tu::
{
	SendRmLast("👍")
}
:*:;td::
{
	SendRmLast("👎")
}
:*:;standing::
{
    SendRmLast("🧍‍♂️")
}
:*:;100::
{
    SendRmLast("💯")
}
:*:;shrug::
{
    SendRmLast("¯\_(ツ)_/¯")
}
:*:;clap::
{
    SendRmLast("👏")
}
:*:;clown::
{
    SendRmLast("🤡")
}
:*:;moai::
{
    SendRmLast("🗿")
}
:*:;crying::
{
    SendRmLast("😭")
}

; Text
:*:;lorem::
{
    A_Clipboard := "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    SendInput("{Ctrl Down}v{Ctrl Up}")
}
:*:;dumplings::
{
    A_Clipboard := "ང་ཚོ་ཁྱོད་རའི་རང་གི་སྤྲོ་མོ་ཡིན། ང་ཚོ་ནི་སྤྲོ་མོ་མི་མང་པོ་དང་མི་འབྲེལ་བའི་དོན་དུ་འབད་དེ་ཡོད། ཁྱོད་རའི་དོན་དུ་མི་འདུག་པའི་མོག་མོག་གི་དོན་དུ་འབད་དེ་ཡོད། ཁྱོད་རའི་དོན་དུ་མི་འདུག་པའི་མོག་མོག་གི་དོན་དུ་འབད་དེ་ཡོད།ད་རེས་ཁྱོད་རའི་དོན་དུ་མི་འདུག་པའི་མོག་མོག་གི་དོན་དུ་འབད་དེ་ཡོད།"

    SendInput("{Ctrl Down}v{Ctrl Up}")
}

; System info shorthands
:*:;date::
{
	Send FormatTime(, "dd.MM.yyyy")
}
:*:;time::
{
	Send FormatTime(, "HH:mm")
}
:*:;formattedtime::
{
    Send FormatTime(, "yyyy-MM-dd_HH-mm-ss_") A_MSec
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
:*:r;num::
{
    bounds := RunDialogue("bounds")
    if bounds == "`b" || bounds == ""
        return

    bounds := StrSplit(bounds, " ")
    numberA := Integer(bounds[1])
    numberB := Integer(bounds[2])
    
    SendText Random(numberA, numberB)
}
:*:r;choice::
{
    options := RunDialogue("options")
    if options == "`b" || options == ""
        return

    options := StrSplit(options, " ")
    choice := Random(1, options.Length)
    SendText options[choice]
}
:*:r;shuffle::
{
    options := RunDialogue("options")
    if options == "`b" || options == ""
        return

    options := StrSplit(options, " ")
    choices := []

    while options.Length > 0
    {
        choices.Push(options.RemoveAt(Random(1, options.Length)))
    } 

    output := ""
    index := 1
    while index <= choices.Length
    {
        output .= choices[index]
        if index < choices.Length
            output .= " "

        index += 1
    }

    SendText output
}
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
    length := RunDialogue("length")
    if length == "`b" || length == ""
        return
    length := Integer(length)

    hex := ""
    Loop length
    {
        value := Random(0, 15)
        hex .= (value < 10) ? value : Chr(value + 87)
    }
    SendText hex
}
:*:r;bin::
{
    length := RunDialogue("length")
    if length == "`b" || length == ""
        return
    length := Integer(length)

    loop length
    {
        SendText Random(0, 1)
    }
}
:*:r;ip::
{
    SendText Random(0, 255) "." Random(0, 255) "." Random(0, 255) "." Random(0, 255)
}
:*:r;text::
{
    length := RunDialogue("length")
    if length == "`b" || length == ""
        return
    length := Integer(length)

    Loop length
    {
        SendText Chr(Random(32, 126))
    }
}
:*:r;letters::
{
    length := RunDialogue("length")
    if length == "`b" || length == ""
        return
    length := Integer(length)

    Loop length
    {
        SendText Chr(Random(97, 122))
    }
}
; Returns true if the element is in the array
ContainsElement(arr, element) ; It's needed because AutoHotkey doesn't have a built-in function for this it seems
{
    for _, value in arr
    {
        if value == element
            return true
    }
    return false
}
:*:r;tibetan::
{
    length := RunDialogue("length")
    if length == "`b" || length == ""
        return
    length := Integer(length)

    disallowedChars := [0x0F48, 0x0F6D, 0x0F6E, 0x0F6F, 0x0F70, 0x0F98, 0x0FBD, 0x0FCD, 0x0FD5, 0xFD6, 0x0FD7, 0x0FD8]

    Loop length
    {
        if (Random(0.0, 1.0) < 0.1)
        {
            SendText " "
            continue
        }

        char := Random(0x0F40, 0x0FDA)
        while ContainsElement(disallowedChars, char)
        {
            char := Random(0x0F40, 0x0FDA)
        }
        SendText Chr(char)
    }
}
:*:r;normal::
{
    ; Normal distribution
    mean := 0
    stdDev := 1

    u1 := Random()
    u2 := Random()
    Pi := 3.141592653589793
    randStdNormal := Sqrt(-2 * Ln(u1)) * Cos(2 * Pi * u2)
    randNormal := Abs(mean + stdDev * randStdNormal)

    SendText randNormal
}
:*:r;word::
{
    words := ["ability","access","accident","account","act","action","activity","actor","ad","addition","address","administration","advantage","advertising","advice","affair","age","agency","agreement","air","airport","alcohol","ambition","amount","analysis","analyst","animal","answer","anxiety","apartment","appearance","apple","application","appointment","area","argument","army","arrival","art","article","aspect","assignment","assistance","assistant","association","assumption","atmosphere","attempt","attention","attitude","audience","aunt","average","awareness","back","bad","balance","ball","bank","baseball","basis","basket","bath","bathroom","bedroom","beer","beginning","benefit","bird","birth","birthday","bit","blood","board","boat","body","bonus","book","boss","bottom","box","boy","boyfriend","bread","breath","brother","building","bus","business","buyer","cabinet","camera","cancer","candidate","capital","car","card","care","career","case","cash","cat","category","cause","celebration","cell","championship","chance","chapter","charity","cheek","chemistry","chest","chicken","child","childhood","chocolate","choice","church","cigarette","city","class","classroom","client","climate","clothes","coast","coffee","collection","college","combination","committee","communication","community","company","comparison","competition","complaint","computer","concept","conclusion","condition","confusion","connection","consequence","construction","contact","context","contract","contribution","control","conversation","cookie","country","county","courage","course","cousin","craft","credit","criticism","culture","currency","customer","cycle","dad","data","database","date","day","dealer","death","debt","decision","definition","delivery","demand","department","departure","depression","depth","description","design","desk","development","device","diamond","difference","difficulty","dinner","direction","director","dirt","disaster","discipline","discussion","disease","disk","distribution","dog","drama","drawer","drawing","driver","ear","earth","economics","economy","editor","education","effect","efficiency","effort","egg","election","elevator","emotion","emphasis","employee","employer","employment","end","energy","engine","entertainment","enthusiasm","entry","environment","equipment","error","establishment","estate","event","exam","examination","example","exchange","excitement","exercise","experience","explanation","expression","extent","eye","face","fact","failure","family","farmer","fat","feature","feedback","field","figure","film","finding","fire","fish","flight","focus","food","football","force","form","fortune","foundation","frame","freedom","friendship","fun","funeral","future","game","garbage","garden","gate","gene","gift","girl","girlfriend","goal","government","grandmother","grocery","group","growth","guest","guidance","guide","guitar","hair","half","hall","hand","hat","head","health","hearing","heart","heat","height","highway","historian","history","home","homework","honey","hope","hospital","hotel","house","housing","ice","idea","image","imagination","impact","importance","impression","improvement","income","independence","indication","industry","inflation","information","initiative","injury","insect","inside","inspection","inspector","instance","instruction","insurance","intention","interaction","interest","internet","introduction","investment","issue","item","job","judgment","key","kind","king","knowledge","lab","ladder","lady","lake","language","law","leader","leadership","length","level","library","life","light","line","link","list","literature","location","loss","love","machine","magazine","maintenance","mall","man","management","manager","manufacturer","map","market","marketing","marriage","material","math","matter","meal","meaning","measurement","meat","media","medicine","medium","member","membership","memory","menu","message","metal","method","midnight","mind","mixture","mode","model","mom","moment","money","month","mood","morning","mouse","movie","mud","music","name","nation","nature","negotiation","network","news","newspaper","night","note","nothing","number","object","obligation","office","oil","operation","opinion","opportunity","orange","order","organization","outcome","outside","oven","owner","page","paint","painting","paper","part","passenger","passion","patience","payment","penalty","people","percentage","perception","performance","period","permission","person","personality","perspective","philosophy","phone","photo","physics","piano","picture","pie","piece","pizza","place","plan","platform","player","poem","poet","poetry","point","police","policy","politics","pollution","population","position","possession","possibility","post","pot","potato","power","practice","preference","preparation","presence","presentation","president","pressure","price","priority","problem","procedure","process","product","profession","professor","profit","program","promotion","property","proposal","protection","psychology","purpose","quality","quantity","queen","question","radio","range","rate","ratio","reaction","reality","reason","reception","recipe","recognition","recommendation","record","recording","reflection","refrigerator","region","relation","relationship","replacement","republic","reputation","requirement","research","resolution","resource","response","responsibility","restaurant","result","revenue","review","revolution","risk","river","road","rock","role","room","rule","safety","salad","salt","sample","satisfaction","scale","scene","school","science","screen","secretary","section","sector","security","selection","sense","series","service","session","setting","shape","share","shirt","side","sign","signature","significance","singer","sir","sister","site","situation","size","skill","society","software","soil","solution","son","song","sound","soup","source","space","speaker","speech","sport","square","standard","star","state","statement","steak","step","stock","storage","store","story","stranger","strategy","stress","structure","student","studio","study","style","subject","success","suggestion","sun","supermarket","surgery","sympathy","system","table","tale","task","tax","tea","teacher","technology","television","temperature","tennis","tension","term","test","thanks","theory","thing","thought","throat","time","tongue","tool","tooth","top","topic","town","trade","tradition","trainer","training","transportation","truth","two","type","uncle","understanding","union","unit","university","user","value","variation","variety","vehicle","version","video","view","village","virus","voice","volume","war","warning","water","way","weakness","wealth","weather","web","wedding","week","while","wife","wind","wing","winner","woman","wood","word","work","worker","world","writer","writing","year","youth"]
    SendText words[Random(1, words.Length)] " "
}
:*:r;password::
{
    length := RunDialogue("length")
    if length == "`b" || length == ""
        return
    length := Integer(length)

    types := ["lowerletters", "upperletters", "numbers"]
    
    Loop length 
    {
        type := types[Random(1, types.Length)]
        char := 0

        while (char == 0 || char == 'O' || char == 'l')
        {
            switch type
            {
                case "lowerletters":
                    char := Chr(Random(97, 122))
                case "upperletters":
                    char := Chr(Random(65, 90))
                case "numbers":
                    char := Random(0, 9)
            }
        }

        SendText char
    }
}

; Commands and system shortcuts
:*:;calc::
{
    expression := RunDialogue("calc")
    if expression == "`b" || expression == ""
        return

    SendText "..."

    RunWait("python.exe ./calc.py " expression, "", "Hide")

    OutputObj := FileOpen(".\calc_output.txt", "r")
    Output := OutputObj.Read()
    OutputObj.Close()

    SendInput("{Backspace 3}")
    
    SendText Output
}
:*:;count::
{
    txt := RunDialogue("text")
    if txt == "`b" || txt == ""
        return

    SendText StrLen(txt)
}
:*:;reverse::
{
    txt := RunDialogue("text")
    if txt == "`b" || txt == ""
        return
        
    reversedText := ""
    Loop StrLen(txt)
    {
        reversedText .= SubStr(txt, -A_Index, 1)
    }
    SendText reversedText
}
:*:;lower::
{
    txt := RunDialogue("text")
    if txt == "`b" || txt == ""
        return

    SendText StrLower(txt)
}
:*:;upper::
{
    txt := RunDialogue("text")
    if txt == "`b" || txt == ""
        return

    SendText StrUpper(txt)
}
:*:;title::
{
    txt := RunDialogue("text")
    if txt == "`b" || txt == ""
        return

    SendText StrTitle(txt)
}
:*:;replace::
{
    txt := RunDialogue("text")
    if txt == "`b" || txt == ""
        return

    replace := RunDialogue("replace")
    if replace == "`b" || replace == ""
        return

    with := RunDialogue("with")
    if with == "`b" || with == ""
        return

    SendText StrReplace(txt, replace, with)
}
:*:;repeat::
{
    txt := RunDialogue("text")
    if txt == "`b" || txt == ""
        return

    times := RunDialogue("times")
    if times == "`b" || times == ""
        return
    times := Integer(times)

    repeatedTxt := ""
    Loop times
    {
        repeatedTxt .= txt
    }
    SendText repeatedTxt
}
:*:;progressbar::
{
    percentage := RunDialogue("percentage")
    if percentage == "`b" || percentage == ""
        return
        
    percentage := Float(percentage) / 100

    length := RunDialogue("length")
    if length == "`b" || length == ""
        return

    length := Integer(length)

    progress := ""
    Loop length
    {
        if (A_Index / length) <= percentage
            progress .= "█"
        else
            progress .= "░"
    }

    SendText progress
}

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

:*:;expl::
{
    SendText "explorer.exe ."
    SendInput("{Enter}")
}
