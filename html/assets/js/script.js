let pedNames = ["James","John","Robert","Michael","William","David","Joseph","Charles","Thomas","Daniel","Matthew","Andrew","Anthony","Christopher","Steven","Kevin","Brian","Mark","Edward","Jason"];

let pedFirstTexts = [
    "Czy masz jakieś pytania?",
    "Potrzebujesz pomocy z czymś?",
    "Czy w czymś konkretnym potrzebujesz wsparcia?",
    "Czym mogę służyć?",
    "W czym mogę ci pomóc?",
    "Masz jakieś potrzeby, którymi mogę się zająć?",
    "Jestem do twojej dyspozycji. W czym mogę pomóc?"
];

let pedOptionOneAnswer = [
    "Ostatnio pojawiły się dziwne światła na niebie. Wiele osób zastanawia się, co to mogło być.",
    "W mieście zbliża się wielki festiwal! Wszyscy przygotowują się na wielkie świętowanie.",
    "Niestety, w ostatnich dniach mamy problem z rosnącą falą kradzieży. Miej oczy szeroko otwarte, gdy wychodzisz.",
    "Właśnie otworzył się nowy sklep z magicznymi rekwizytami. To prawdziwy raj dla magów i czarodziejów!",
    "W mieście odbył się niedawno turniej gladiatorów w arenie. Było niesamowite widowisko!",
    "Słyszałeś o tajemniczym stworzeniu, które widziano na obrzeżach lasu? Ludzie są ciekawi, co to może być.",
    "W mieście pojawił się znany bard, który opowiada niesamowite historie. Warto go posłuchać!",
    "Nowy burmistrz ogłosił program modernizacji infrastruktury. Pewnie zacznie się wiele budów i napraw.",
    "Ostatnio naukowcy odkryli starożytny zamek pod miastem! Teraz archeolodzy badają jego tajemnice."
];

let userOptionOneAnswer = [
    "Wow, to brzmi naprawdę tajemniczo!",
    "Nie mogę się doczekać festiwalu!",
    "To niepokojące. Muszę być ostrożny.",
    "Muszę odwiedzić ten sklep! Brzmi jak raj dla magów!",
    "To musiało być niezwykłe widowisko!",
    "O, to brzmi ekscytująco!",
    "Chętnie posłucham jego opowieści!",
    "To świetne wieści! Miasto będzie jeszcze lepsze!",
    "Muszę odwiedzić ten zamek!"
]

let drugSellPotion = false
let endTexting = null

function option(id) {
    if (id === 1) {
        if (endTexting == 1) {
            $('body').css({display: 'none'})
            $.post(`https://${GetParentResourceName()}/closetexting`, JSON.stringify({}));
            endTexting = null
        } else {
            endTexting = 1
            $('#option1').css({display: 'none'})
            $('#option2').css({display: 'none'})
            $('#option1-change').css({display: 'block'})
            $('.main-container').css({height: '10vh'})
            document.getElementById("option-3-text-edit").innerHTML = "Dobra stary, muszę lecieć. Trzymaj się!"
            const randomIndex = Math.floor(Math.random() * pedOptionOneAnswer.length);
            const randomText = pedOptionOneAnswer[randomIndex];
            document.getElementById("ped-say").innerHTML = randomText;
            document.getElementById("option-1-change-text-edit").innerHTML = userOptionOneAnswer[randomIndex];
        }
        
    } else if (id === 2) {
        document.getElementById("ped-say").innerHTML = "Hmm, brzmi ciekawie. Co masz do zaoferowania?"
        $('#option1').css({display: 'none'})
        $('#option2').css({display: 'none'})
        $('#option3').css({display: 'none'})
        $('#option2-drugs-select1').css({display: 'block'})
        $('#option2-drugs-select2').css({display: 'block'})
        $('#option2-drugs-select3').css({display: 'block'})
    } else if (id === 3) {
        $('body').css({display: 'none'})
        if (drugSellPotion == true) {
            $.post(`https://${GetParentResourceName()}/agresiveclose`, JSON.stringify({}));
        } else {
            $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
        }
    }
}

function drugsOption(id) {
    drugSellPotion = true
    if (id === 1) {
        $.post(`https://${GetParentResourceName()}/sellDrugs`, JSON.stringify({
            dragtype: 1,
        }));
        $('.drugs-input').css({display: 'block'})
        $('.drugs-sell-confirm-button').css({display: 'flex'})
        $('.option').css({marginTop: '1vh'})
        $('#option2-drugs-select1').css({display: 'none'})
        $('#option2-drugs-select2').css({display: 'none'})
        $('#option2-drugs-select3').css({display: 'none'})
        $('#option3').css({display: 'block'})
        document.getElementById("ped-say").innerHTML = "Ile chcesz za 1 gram mety?"
        document.getElementById("option-3-text-edit").innerHTML = "Jebać to"
    } else if (id === 2) {
        $.post(`https://${GetParentResourceName()}/sellDrugs`, JSON.stringify({
            dragtype: 2,
        }));
        $('.drugs-input').css({display: 'block'})
        $('.drugs-sell-confirm-button').css({display: 'flex'})
        $('#option2-drugs-select1').css({display: 'none'})
        $('#option2-drugs-select2').css({display: 'none'})
        $('#option2-drugs-select3').css({display: 'none'})
        $('#option3').css({display: 'block'})
        $('.option').css({marginTop: '1vh'})
        document.getElementById("ped-say").innerHTML = "Ile chcesz za 1 marychy?"
        document.getElementById("option-3-text-edit").innerHTML = "Jebać to"
    } else if (id === 3) {
        $.post(`https://${GetParentResourceName()}/sellDrugs`, JSON.stringify({
            dragtype: 3,
        }));
        $('.drugs-input').css({display: 'block'})
        $('.drugs-sell-confirm-button').css({display: 'flex'})
        $('#option2-drugs-select1').css({display: 'none'})
        $('#option2-drugs-select2').css({display: 'none'})
        $('#option2-drugs-select3').css({display: 'none'})
        $('#option3').css({display: 'block'})
        $('.option').css({marginTop: '1vh'})
        document.getElementById("ped-say").innerHTML = "Ile chcesz za 1 gram opium?"
        document.getElementById("option-3-text-edit").innerHTML = "Jebać to"
    } 
}

function sellDrugs() {
    const drugsInput = document.getElementById('drugs-input');
    const getingValue = drugsInput.value.trim();
    const priceValue = parseInt(getingValue);
    
    $.post(`https://${GetParentResourceName()}/sellPrice`, JSON.stringify({
        sellPrice: priceValue,
    }));
}

window.addEventListener('message', function(event) {
    if (event.data.action == 'open') {
        $('body').css({display: 'block'})
        $('#option1').css({display: 'block'})
        $('#option2').css({display: 'block'})
        $('#option3').css({display: 'block'})
        $('#option1-change').css({display: 'none'})
        $('.main-container').css({height: '8vh'})
        $('.drugs-input').css({display: 'none'})
        $('.drugs-sell-confirm-button').css({display: 'none'})
        $('.option').css({marginTop: '3.5vh'})
        document.getElementById("option-3-text-edit").innerHTML = "Już nic."
        document.getElementById("name-ped").innerHTML = pedNames[Math.floor(Math.random() * pedNames.length)]
        document.getElementById("ped-say").innerHTML = pedFirstTexts[Math.floor(Math.random() * pedFirstTexts.length)]
    }
    if (event.data.action == 'nodrugopen') {
        $('body').css({display: 'block'})
        $('#option1').css({display: 'block'})
        $('#option2').css({display: 'none'})
        $('#option3').css({display: 'block'})
        $('#option1-change').css({display: 'none'})
        $('.main-container').css({height: '8vh'})
        $('.drugs-input').css({display: 'none'})
        $('.drugs-sell-confirm-button').css({display: 'none'})
        $('.option').css({marginTop: '3.5vh'})
        document.getElementById("option-3-text-edit").innerHTML = "Już nic."
        document.getElementById("name-ped").innerHTML = pedNames[Math.floor(Math.random() * pedNames.length)]
        document.getElementById("ped-say").innerHTML = pedFirstTexts[Math.floor(Math.random() * pedFirstTexts.length)]
    }
    if (event.data.action == 'close') {
        $('body').css({display: 'none'})
    }
    if (event.data.action == 'nikoend') {
        $('body').css({display: 'none'})
    }
});