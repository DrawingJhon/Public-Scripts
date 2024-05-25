var oM;
var cr, ab;
var eA = 1920;
var ip = 1080;
var gO;
var fS = false;
var eJ = new dB();
var lD = 10;
var qp;
var rJ;
function dO() {
    if (oM == undefined) {
        oM = createjs;
    }
    if (cr == undefined) {
        cr = cX(ek.id, 'theCanvas', 'canvas');
        cr.style.backgroundColor = "#366";
    }
    if (ab == undefined) {
        ab = new oM.Stage(cr);
        ab.snapToPixelEnabled = true;
        ab.enableMouseOver(lD);
        oM.Touch.enable(ab);
        oM.Ticker.interval = parseInt(1000 / 24);
        oM.Ticker.on("tick", function() {
            ab.update();
        });
        ab.on("stagemousedown", eF);
        ab.regX = parseInt(eA / 2);
    }
    dN();
    window.addEventListener('resize', dN, false);
}
;function qW() {
    var pa = document.createElement("canvas").getContext("2d");
    var nG = window.devicePixelRatio || 1;
    var nQ = pa.webkitBackingStorePixelRatio || pa.mozBackingStorePixelRatio || pa.msBackingStorePixelRatio || pa.oBackingStorePixelRatio || pa.backingStorePixelRatio || 1;
    return nG / nQ;
}
;function dN() {
    if (qs()) {
        document.dispatchEvent(F("hideZoneBottom"));
        return;
    } else {
        document.dispatchEvent(F("showZoneBottom"));
    }
    var mh = qW();
    var iH = parseInt(ek.clientWidth);
    var hQ = parseInt(ek.clientHeight);
    var hU = Math.ceil(iH * mh);
    var ik = Math.ceil(hQ * mh);
    if (cr.width !== hU || cr.height !== ik) {
        cr.width = hU;
        cr.height = ik;
        cr.style.width = iH + "px";
        cr.style.height = hQ + "px";
        cr.getContext("2d").setTransform(mh, 0, 0, mh, 0, 0);
        var ii = Math.min(hU / eA, ik / ip);
        ab.scale = ii;
        ab.x = parseInt(hU / 2);
    }
}
;function fF() {
    if (ek.clientWidth < 730 || ek.clientHeight < 300) {
        return true;
    }
    return false;
}
;var ew;
var dW;
var ea;
var jg;
var eE;
var er;
var fl;
var eS;
var gw;
function dF() {
    this.lZ = 0;
    this.mU = 1;
    this.lP = 2;
    this.mj = 3;
    var jJ = new Array();
    if (ea == undefined) {
        ea = new oM.MovieClip().set({
            y: 110
        });
        ea.maxWidth = eA - 20;
        ea.maxHeight = ip - 120;
        ew.addChild(ea);
    }
    this.qq = function(gj) {
        var km;
        if (jJ[gj] == undefined) {
            switch (gj) {
            case this.lZ:
                km = bK();
                break;
            case this.mU:
                km = av();
                break;
            case this.lP:
                km = ad();
                break;
            case this.mj:
                km = aK();
                break;
            }
            if (km != undefined) {
                jJ[gj] = km;
                ea.addChild(km);
            }
        }
        return jJ[gj];
    }
    ;
    this.show = function(gj, iQ) {
        if (this.nq(gj) == false) {
            this.oc();
            var km = this.rc(gj);
            eS.show();
            setTimeout(function() {
                eS.hide();
                km.show(iQ);
                eJ.fadeIn(km);
            }, 1000);
        }
    }
    ;
    this.hide = function(gj) {
        this.oc();
    }
    ;
    this.oc = function() {
        for (i = 0; i < jJ.length; i++) {
            if (jJ[i] != undefined) {
                if (jJ[i].visible == true) {
                    eJ.fadeOut(jJ[i]);
                    jJ[i].hide();
                }
            }
        }
    }
    ;
    this.nq = function(gj) {
        var km = jJ[gj];
        if (km != undefined) {
            return km.visible;
        }
        return false;
    }
    ;
    this.rc = function(gj) {
        return this.qq(gj);
    }
}
;var ho = false;
var hm = 0;
var kM = new Uint8Array();
var gB = new Uint8Array();
function ag() {
    kM = aP();
    if (jm) {
        bw();
        gB = bb();
        ho = true;
    }
}
;function bw() {
    hm = 0;
    if (jm) {
        for (var i = 0; i < jm.length; i++) {
            hm = hm + jm.charCodeAt(i);
        }
    }
}
;function aH(aJ) {
    if (ho == false) {
        ag();
    }
    return fp(gk(aJ));
}
;function bf(aJ) {
    if (aJ != '' && ho == true) {
        var fe = ax(aJ);
        var aW = new Uint8Array(fe.length);
        var gY = (-1);
        for (var i = 0; i < fe.length; i++) {
            gY = bd(gB, fe[i]);
            if (gY > (-1)) {
                aW.set([gY], i);
            }
        }
        return aW;
    }
    return (new Uint8Array());
}
;function bI(aJ) {
    if (ho == false) {
        ag();
    }
    return fs(kH(aJ));
}
;function aq(aJ) {
    if (aJ != '' && ho == true) {
        var fe = ax(aJ);
        var aW = new Uint8Array(fe.length);
        for (var i = 0; i < fe.length; i++) {
            if (fe[i] < gB.length) {
                aW[i] = gB[fe[i]];
            }
        }
        return aW;
    }
    return (new Uint8Array());
}
;function aP() {
    var jo = new Uint8Array(new ArrayBuffer(256));
    for (var i = 0; i < jo.length; i++) {
        jo[i] = i;
    }
    return jo;
}
;function bb() {
    var ec = kM;
    var iK = new Uint8Array(ec.length);
    while (ec.length > 0) {
        var iP = parseInt(hm % ec.length);
        var gY = ec[iP];
        iK[iK.length - ec.length] = gY;
        var la = ec.subarray(0, iP);
        var lV = ec.subarray(iP + 1);
        ec = aa(la, lV);
    }
    return iK;
}
;function aa(gS, rY) {
    var ga = new (gS.constructor)(gS.length + rY.length);
    ga.set(gS, 0);
    ga.set(rY, gS.length);
    return ga;
}
;function ax(aJ) {
    var array = new Uint8Array(new ArrayBuffer(aJ.length));
    for (var i = 0; i < aJ.length; i++) {
        array[i] = aJ.charCodeAt(i);
    }
    return array;
}
;function bB(pl) {
    return String.fromCharCode.apply(null, pl);
}
;function bd(fi, ld) {
    for (var i = 0; i < fi.length; i++) {
        if (fi[i] == ld) {
            return i;
        }
    }
    return -1;
}
;var jr = {
    76: cJ,
    81: cS,
    84: aY,
    85: bg
};
function execCommand(v) {
    if (v.length > 0) {
        var command = v.charCodeAt(0);
        if (typeof jr[command] != "undefined") {
            jr[command](v.split(ha));
        } else {}
    }
}
;function aY(v) {}
;function bg(v) {
    if (v.length > 0) {
        var aW = aE(v, 2);
        if (v[1] != "" && aW != "") {
            if (typeof cN !== 'undefined') {
                cN.kY(parseInt(v[1]), aW);
            } else {}
        }
    }
}
;function cJ(v) {
    if (v != "") {
        bD = v[1];
    }
}
;function cS(v) {
    it = parseInt(v[1]);
    eP(v[2]);
    if (kb['csv2'] == undefined) {
        ei()
    } else {
        rr()
    }
}
;function eP(bY) {
    if (bY < 0) {
        bY = 0;
    }
    gI = parseInt(bY);
}
;function ao(iM) {
    if (L != undefined) {
        eB = L.change(iM);
    }
}
;function bc() {
    var iX = 'en';
    var lang = iX;
    var es = new Array();
    var prefix = 'ln_';
    this.init = function() {
        eB = this.ov();
        eg.mP(prefix + iX, this.pK(iX));
        eB = this.change(eB);
    }
    ;
    this.ov = function() {
        var iC = x = window.navigator.language || navigator.browserLanguage;
        iC = iC.split("-")[0];
        return iC.toLowerCase();
    }
    ;
    this.change = function(fN) {
        fN = fN.toLowerCase();
        if (il.includes(fN)) {
            lang = fN;
            if (es[fN] == undefined) {
                this.tj(fN)
            }
            return fN;
        }
        return null;
    }
    ;
    this.dJ = function(gK) {
        if (es[lang] != undefined) {
            if (es[lang][gK] != undefined) {
                if (es[lang][gK] != "") {
                    return es[lang][gK];
                }
            }
        }
        if (es[iX] != undefined) {
            if (es[iX][gK] != undefined) {
                return es[iX][gK];
            }
        }
        return "";
    }
    ;
    this.pf = function(fN) {
        if (es[fN] != undefined) {
            return true;
        } else {
            return false;
        }
    }
    ;
    this.V = function(fN, dH, au) {
        if (fN != "") {
            fN = fN.toLowerCase();
            if (es[fN] == undefined) {
                es[fN] = new Array();
            }
            if (dH != "") {
                es[fN][dH] = au;
            }
        }
    }
    ;
    this.tj = function(iM) {
        eg.mP(prefix + iM, this.pK(iM));
        eg.load();
        document.addEventListener("fileLoaded", this.pR, false);
    }
    ;
    this.pR = function(bQ) {
        document.removeEventListener("fileLoaded", this.pR, false);
        for (const hK in kb) {
            if (hK.substr(0, 3) == prefix) {
                var iM = hK.substr(3, 2);
                if (es[iM] == undefined) {
                    L.rC(iM, kb[hK].response);
                }
            }
        }
        gw.mq();
    }
    ;
    this.rC = function(iM, v) {
        var v = JSON.parse(v).data;
        for (const hK in v) {
            L.V(iM, hK, v[hK]);
        }
    }
    ;
    this.pK = function(iM) {
        return 'data/lang/' + iM + '.csv'
    }
}
;var dj = {
    mC: 71,
    nn: 72,
    lu: 100,
    kR: 73,
    gW: 74,
    oZ: 75,
    oS: 76,
    mu: 76,
    nC: 77,
    oB: 78,
    oh: 79,
    ou: 80,
    nS: 101,
    md: 102,
    pP: 103,
    pr: 81,
    oH: 82,
    om: 84,
    pb: 90,
    mB: 91,
    mg: 93
};
var il = new Array('da','de','en','es','fr','it','hu','nl','no','pl','pt','ro','sv','tr');
var rV = new Array('DANSK','DEUTSCH','ENGLISH','ESPAÑOL','FRANÇAIS','ITALIANO','MAGYAR','NEDERLANDS','NORWEGIAN','POLSKI','PORTUGUÊS','ROMÂNĂ','SVENSKA','TÜRKÇE');
var L;
var eB;
var ha = ";";
var eD = "\r";
var bD = "player";
var al = {};
var gI = 0;
var fE = 0;
var it = 0;
function cX(fU, kh, fD) {
    if (typeof fD == "undefined") {
        fD = 'div';
    }
    fU = document.getElementById(fU);
    if (fU != null) {
        var jd = document.createElement(fD);
        jd.id = kh;
        fU.appendChild(jd);
        return jd;
    }
    return null;
}
;function am() {
    fS = qb.any();
    if (ek != null) {
        L = new bc();
        L.init();
        dO();
        bN();
        eS.show();
        dW.show(dW.lZ);
    }
}
;function bN() {
    if (ew == undefined) {
        ew = new oM.MovieClip();
        ab.addChild(ew);
    }
    if (dW == undefined) {
        dW = new dF();
    }
    if (eE == undefined) {
        eE = aQ();
        ew.addChild(eE);
    }
    if (eS == undefined) {
        eS = dk();
        ew.addChild(eS);
    }
    if (er == undefined) {
        er = ds();
        ew.addChild(er);
    }
    if (fl == undefined) {
        fl = qN();
        ew.addChild(fl);
    }
}
;function ei() {
    qP(2)
}
;function du() {
    document.removeEventListener("fileLoaded", du, false);
    bq();
    rr();
}
;function rr() {
    qp = sT;
    rJ = rI;
    setTimeout(rj, 1000)
}
;function sT() {
    if (jg == 1) {
        pU();
    } else if (jg == 2) {
        pU(it);
    } else if (jg == 3) {
        dW.show(dW.mU, 2)
    }
}
;function ac(dw) {
    dw = aj(dw);
    return dw.replace(/\s/g, "").trim();
}
;function bK() {
    var bn = new oM.MovieClip().set({
        visible: false
    });
    eI(bn);
    bn.show = function() {
        gw.da = bD;
        gw.lang = eB;
        eE.sO();
        gw.mq();
        ab.setChildIndex(this, ab.children.length - 1);
        this.visible = true;
    }
    ;
    bn.hide = function() {
        eE.oA();
        eE.sn();
        this.visible = false;
    }
    ;
    return bn;
}
;function eI(fU) {
    if (ab != undefined) {
        if (gw == undefined) {
            gw = di();
            fU.addChild(gw);
        }
    }
}
;function cq(km) {
    var gg = km.getBounds();
    var jk = new oM.Shape();
    jk.graphics.setStrokeStyle(2).beginStroke("#F00").drawRect(0, 0, gg.width, gg.height);
    km.addChild(jk);
}
;function O(km) {
    var gg = km.getBounds();
    km.set({
        regX: parseInt(gg.width / 2),
        regY: parseInt(gg.height / 2),
        x: parseInt(ea.maxWidth / 2),
        y: parseInt(ea.maxHeight / 2)
    });
}
;function di() {
    var bn = new oM.MovieClip();
    bn.setScale = function() {
        bn.scale = fF() ? 1.8 : 1.3;
    }
    ;
    window.addEventListener('resize', bn.setScale, false);
    bn.setScale();
    bn.setBounds(0, 0, 760, 700);
    O(bn);
    bn.iq = new oM.Bitmap(kb['logoIntro']).set({
        x: 80
    });
    bn.lh = new oM.MovieClip().set({
        y: 350
    });
    var aO = new oM.Shape();
    aO.graphics.setStrokeStyle(6).beginFill("#333").drawRoundRect(0, 0, 760, 280, 25);
    aO.alpha = .2;
    bn.iU = new oM.Text('Nick:',"22px Helvetica","#EEE").set({
        x: 30,
        y: 28,
        lineWidth: 400
    });
    bn.iU.text = L.dJ('TNI');
    var rz = new oM.MovieClip();
    var gb = new oM.Shape();
    gb.graphics.setStrokeStyle(1).beginStroke("#FFF").beginFill(createjs.Graphics.getRGB(255, 255, 255, .3)).drawRoundRect(0, -8, 700, 60, 16);
    rz.addChild(gb);
    var kd = sH('', '#EEE').set({
        x: 30,
        y: 64
    });
    kd.mw(rz);
    kd.fL(bD);
    jj = jK(700, 56, 3, "#FE0", "#FE0", 1);
    dV = jK(700, 56, 3, '#FC0', '#FC0', 1);
    fk = sS(700, 56, 30, "#333");
    su = sC(700, 56, jj, dV, fk).set({
        x: 30,
        y: 130
    });
    su.on("click", function() {
        jg = 1;
        bn.onClick()
    });
    ti = createjs.Graphics.getRGB(255, 255, 255, .2);
    sA = createjs.Graphics.getRGB(255, 255, 255, .01);
    jj = jK(340, 46, 1, "#FFF", ti, 1);
    dV = jK(340, 46, 1, '#FC0', sA, 1);
    fk = sS(340, 46, 22, "#FC0");
    qn = sC(340, 46, jj, dV, fk).set({
        x: 30,
        y: 200
    });
    qn.rU = '#FC0';
    qn.sF = '#FFF';
    qn.on("click", function() {
        jg = 2;
        bn.onClick()
    });
    jj = jK(340, 46, 1, "#FFF", ti, 1);
    dV = jK(340, 46, 1, '#FC0', sA, 1);
    fk = sS(340, 46, 22, "#FC0");
    kf = sC(340, 46, jj, dV, fk).set({
        x: 390,
        y: 200
    });
    kf.rU = '#FC0';
    kf.sF = '#FFF';
    kf.on("click", function() {
        jg = 3;
        bn.onClick()
    });
    bn.lh.addChild(aO, bn.iU, kd, su, qn, kf);
    bn.addChild(bn.iq, bn.lh);
    bn.onClick = function() {
        bD = ac(kd.rm());
        ak();
    }
    ;
    bn.mq = function() {
        bn.iU.text = L.dJ('TNI');
        su.fL(L.dJ('TQPL'));
        qn.fL(L.dJ('TMPL'));
        kf.fL(L.dJ('TMPR'));
    }
    ;
    return bn;
}
;function sS(gc=100, ht=56, sQ=30, dS="#FFF") {
    var au = new oM.Text('',"bold " + sQ + "px Helvetica",dS).set({
        x: gc / 2,
        y: ht / 2,
        textBaseline: 'middle',
        textAlign: "center"
    });
    return au;
}
;function jK(gc=100, ht=56, rO=3, tg="#FFF", sa='#EEE', sl=1) {
    var gb = new oM.Shape();
    gb.graphics.setStrokeStyle(rO).beginStroke(tg).beginFill(sa).drawRoundRect(0, 0, gc, ht, 16);
    gb.alpha = sl;
    return gb;
}
;function sC(gc, ht, jj, dV, fk) {
    var bn = new oM.MovieClip();
    bn.mouseChildren = false;
    bn.cursor = "pointer";
    bn.rU = bn.sF = '#333';
    bn.jj = jj;
    bn.dV = dV;
    bn.jj.visible = false;
    bn.au = fk;
    bn.addChild(bn.dV, bn.jj, bn.au);
    var rQ = function(e) {
        bn.dV.visible = false;
        bn.jj.visible = true;
        bn.au.color = bn.sF;
    };
    var rw = function(e) {
        bn.dV.visible = true;
        bn.jj.visible = false;
        bn.au.color = bn.rU;
    };
    bn.on("mouseover", rQ);
    bn.on("mouseout", rw);
    bn.fL = function(aJ) {
        bn.au.text = aJ;
    }
    ;
    return bn;
}
;function j(aJ) {
    aJ = aJ.toUpperCase();
    gc = 440;
    ht = 80;
    var bn = new oM.MovieClip();
    bn.mouseChildren = false;
    bn.pM = new oM.Shape();
    bn.pM.graphics.setStrokeStyle(2).beginStroke("#666").beginFill("#066").drawRoundRect(0, 0, gc, ht, 10);
    bn.pQ = new oM.Shape().set({
        x: 1,
        y: 1
    });
    bn.pQ.graphics.setStrokeStyle(2).beginStroke("#ACC").beginLinearGradientFill(["#8bb9b9", "#4a9292"], [0, 1], 0, 0, 0, ht - 6).drawRoundRect(0, 0, gc - 2, ht - 6, 10);
    bn.gf = new oM.Shape().set({
        alpha: .1,
        visible: false
    });
    bn.gf.graphics.beginFill("#FFF").drawRoundRect(0, 0, gc, ht - 6, 10);
    bn.gf.cache(0, 0, gc, ht - 6);
    bn.addChild(bn.pM, bn.pQ, bn.gf);
    bn.je = new oM.MovieClip();
    bn.je.au = new oM.Text(aJ,"bold 50px Helvetica","#FFF").set({
        textAlign: "center"
    }).set({
        x: gc / 2,
        y: ht / 2,
        textBaseline: 'middle'
    });
    bn.je.iG = bn.je.au.clone();
    bn.je.iG.set({
        outline: 3,
        color: "#333"
    });
    bn.je.addChild(bn.je.iG, bn.je.au);
    bn.je.cache(0, 0, gc, ht);
    bn.addChild(bn.je);
    var sf = new createjs.Shape();
    sf.graphics.beginFill("#000").drawRect(0, 0, gc, ht);
    bn.hitArea = sf;
    bn.cursor = "pointer";
    bn.on("mouseover", function(e) {
        this.onMouseOver();
    });
    bn.on("mouseout", function(e) {
        this.onMouseOut();
    });
    bn.onMouseOver = function() {
        bn.gf.visible = true;
    }
    ;
    bn.onMouseOut = function() {
        bn.gf.visible = false;
    }
    ;
    return bn;
}
;if (!String.prototype.trim) {
    (function() {
        var pd = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
        String.prototype.trim = function() {
            return this.replace(pd, '');
        }
        ;
    }
    )();
}
function eH(gm, gg) {
    if (gm.x >= gg.x && gm.y >= gg.y && gm.x <= (gg.x + gg.width) && gm.y <= (gg.y + gg.height)) {
        return true;
    }
    return false;
}
;function df(fB) {
    if (fB == undefined) {
        return false;
    }
    if (fB.visible == false) {
        return false;
    }
    var fU = fB.parent;
    while (fU != null) {
        if (fU.visible == false) {
            return false;
        }
        fU = fU.parent;
    }
    var gm = fB.globalToLocal(ab.mouseX, ab.mouseY);
    return fB.hitTest(gm.x, gm.y);
}
;function C(aJ, lB) {
    for (var i = 0; i < lB.length; i++) {
        aJ = aJ.replace("%s", lB[i]);
    }
    return aJ;
}
;function aj(au) {
    return au.replace(/(<([^>]+)>)/ig, "");
}
;function fJ(dH) {
    if (document.getElementById(dH)) {
        return true;
    }
    return false;
}
;function mT(aJ) {
    return fp(gk(aJ));
}
;function lG(aJ) {
    return fs(kH(aJ));
}
;function fp(aJ) {
    try {
        return window.btoa(aJ)
    } catch (jn) {
        return aJ;
    }
}
;function kH(aJ) {
    try {
        return window.atob(aJ.trim())
    } catch (jn) {
        return aJ;
    }
}
;function gk(aJ) {
    try {
        return unescape(encodeURIComponent(aJ));
    } catch (jn) {
        return aJ;
    }
}
;function fs(aJ) {
    try {
        return decodeURIComponent(escape(aJ));
    } catch (jn) {
        return aJ;
    }
}
;var qb = {
    pG: function() {
        return navigator.userAgent.match(/Android/i) ? true : false;
    },
    pN: function() {
        return navigator.userAgent.match(/BlackBerry/i) ? true : false;
    },
    rd: function() {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i) ? true : false;
    },
    opera: function() {
        return navigator.userAgent.match(/Opera Mini/i) ? true : false;
    },
    qw: function() {
        return navigator.userAgent.match(/IEMobile/i) ? true : false;
    },
    any: function() {
        return (qb.pG() || qb.pN() || qb.rd() || qb.opera() || qb.qw()) ? true : false;
    }
};
function aE(fi, ft) {
    if (typeof ft == "undefined") {
        ft = 0;
    }
    var result = "";
    if (fi.length > 0) {
        if (ft == 0) {
            result = fi.join(ha);
        } else {
            result = fi.splice(ft).join(ha);
        }
    }
    return result;
}
;function T() {
    var aJ = String.fromCharCode(arguments[0]);
    for (var i = 1; i < arguments.length; ++i) {
        aJ += ha + arguments[i].toString().trim();
    }
    return aJ;
}
;function h(v) {
    if (v.length > 0) {
        v = aH(v) + eD;
        var send = aN(v);
        return send;
    }
    return false;
}
;function bk() {
    if (jD) {
        az();
        aB();
        return true;
    }
    return false;
}
;function az() {
    var aW = T(dj.mC, bD, jD, eB.toUpperCase(), gP, 'N');
    h(aW);
}
;function aB() {
    var aW = T(dj.om, gP, gA);
    h(aW);
}
;function pU(dH=null, eh=null) {
    var aW;
    if (dH != null && eh != null) {
        aW = T(dj.gW, dH, eh);
    } else if (dH != null) {
        aW = T(dj.gW, dH);
    } else {
        aW = T(dj.gW);
    }
    h(aW);
}
;function bq() {
    var aW = T(dj.mg, 'A');
    h(aW);
}
;function dK(bQ) {
    if (bS(bQ.data)) {
        iy = iy + bQ.data;
        eW();
    }
}
;function eW() {
    var v = bm();
    if (v != '') {
        var kc = v.split(eD);
        for (var iS = 0; iS < kc.length; iS++) {
            var hu = kc[iS];
            if (hu.length > 0) {
                hu = bI(hu);
                hu = hu.split(eD);
                for (var ji = 0; ji < hu.length; ji++) {
                    execCommand(hu[ji]);
                }
            }
        }
    }
}
;function uC() {
    eS.show();
    dW.show(dW.lZ);
}
;function onClose(bQ) {
    dR = null;
    eE.rs();
    dW.oc();
    er.show({
        fV: L.dJ('TSHPLC'),
        fM: [{
            name: 'OK',
            path: uC
        }]
    });
}
;function ak() {
    dW.hide(dW.lZ);
    eS.show();
    ar(pO);
}
;var dR = null;
var iy = "";
function ar(lA) {
    if (aT() == false) {
        iy = "";
        var error = false;
        try {
            dR = new WebSocket(lA);
        } catch (e) {
            error = true;
        }
        if (error == false) {
            bp();
        }
    }
}
;function tf() {
    sb();
    try {
        dR.close();
        dR = null;
    } catch (jn) {}
}
;function bp() {
    dR.onopen = bk;
    dR.onmessage = dK;
    dR.onclose = onClose
}
;function sb() {
    try {
        dR.onopen = null;
        dR.onmessage = null;
        dR.onclose = null
    } catch (jn) {}
}
;function bm() {
    if (iy.indexOf(eD) > (-1)) {
        var ll = iy.split(eD);
        iy = ll.pop();
        return ll.join(eD);
    }
    return "";
}
;function aN(v) {
    if (aT()) {
        try {
            dR.send(v);
        } catch (e) {
            return false;
        }
        return true;
    }
    return false;
}
;function aT() {
    if (dR != null) {
        if (dR.readyState == 1) {
            return true;
        }
    }
    return false;
}
;function bS(v) {
    if (typeof v == 'string') {
        if (v.length > 0) {
            return true;
        }
    }
    return false;
}
;var cN = new dr();
function dr() {
    var ez = [];
    this.mute = false;
    this.kY = function(cg, lm) {
        var iF = new Audio(lm);
        if (iF.error == null) {
            ez[parseInt(cg)] = iF;
        }
    }
    ;
    this.play = function(cg, time) {
        if (typeof time == "undefined") {
            time = 0;
        }
        if (this.fW(cg)) {
            if (this.oa(cg) == true) {
                this.stop(cg);
            }
            var jS = ez[cg].play();
            if (jS !== undefined) {
                jS.then(function() {}).catch(function(error) {});
            }
        }
    }
    ;
    this.stop = function(cg) {
        if (this.fW(cg)) {
            ez[cg].pause();
            ez[cg].currentTime = 0;
        }
    }
    ;
    this.kU = function(cg, oq, mJ) {
        if (this.fW(cg)) {
            for (var i = 0; i < oq; i++) {
                setTimeout(function() {
                    cN.play(cg);
                }, mJ * i);
            }
        }
    }
    ;
    this.ph = function(jP) {
        this.mute = jP;
        for (var cg in ez) {
            if (this.fW(cg)) {
                ez[cg].mute = jP;
            }
        }
    }
    ;
    this.fW = function(cg) {
        if (ez[cg]) {
            if (ez[cg].error == null) {
                return true;
            }
        }
        return false;
    }
    ;
    this.oa = function(cg) {
        if (this.fW(cg)) {
            if (ez[cg].duration > 0 && !ez[cg].paused) {
                return true;
            }
            return false;
        }
    }
}
;function ix(dw) {
    var gv = dw;
    this.da = dw;
    this.pos = 1;
    this.fj = 0;
    this.eQ = false;
    this.el = 0;
    this.fa = 0;
    this.lq = false;
    this.jf = false;
    this.fO = true;
    this.jB = "";
    this.jY;
    this.or = function() {
        this.jB = Number(this.fO) + this.da.toLowerCase();
    }
    ;
    this.oQ = function() {
        this.iZ(0);
        this.fa = 0;
        this.gs(false);
    }
    ;
    this.nX = function() {
        this.gs(false);
    }
    ;
    this.mW = function() {
        this.lq = false;
        this.eQ = false;
        this.el = 0;
        this.gq(false);
    }
    ;
    this.iZ = function(v) {
        this.fj = v;
    }
    ;
    this.kL = function(v) {
        this.eQ = true;
        this.fa++;
        this.el = v;
    }
    ;
    this.oC = function(v) {
        this.pos = v;
    }
    ;
    this.oO = function(v) {
        this.lq = v;
        if (v == true) {
            this.gs(true);
        }
    }
    ;
    this.gs = function(v) {
        if (v == 0) {
            this.jf = false;
        }
        if (v == 1) {
            this.jf = true;
        }
    }
    ;
    this.gq = function(v) {
        if (v == 0) {
            this.fO = false;
        }
        if (v == 1) {
            this.fO = true;
        }
    }
}
;function nr() {
    var gM = [];
    this.np = function(dw) {
        if (gM.indexOf(dw) == (-1)) {
            gM.push(dw);
        }
    }
    ;
    this.nb = function(dw) {
        var ft = gM.indexOf(dw);
        if (ft > (-1)) {
            gM.splice(ft, 1);
        }
    }
    ;
    this.kt = function(dw) {
        if (gM.indexOf(dw) > (-1)) {
            return true;
        }
        return false;
    }
}
;function sY(dS) {
    if (eV != dS) {
        if (dS.charAt(0) == "#") {
            dS = dS.substr(1);
        }
        if (dS.length == 3) {
            var oK = dS.charAt(0) + dS.charAt(0);
            var oz = dS.charAt(1) + dS.charAt(1);
            var nU = dS.charAt(2) + dS.charAt(2);
            eV = oK + oz + nU;
        } else if (dS.length == 6) {
            eV = dS;
        } else {
            eV = kB;
        }
        et.nR(eV);
    }
}
;var eT = new Array();
var gx;
var fm;
var hc;
var hE;
var fg;
var hH;
var fr;
var gd;
var gZ;
var hs;
var hD;
function H(he) {
    eT.push(he);
    if (eT.length == 1) {
        kp();
    }
}
;function ah() {
    if (eT.length > 0) {
        eT.splice(0, 1);
        kp();
    }
}
;function kp() {
    if (eT.length > 0) {
        eT[0].show();
    }
}
;function iA() {
    eT = new Array();
}
;function l() {
    if (ab != undefined) {
        gx.hide();
        fm.hide();
        fg.hide();
        hE.hide();
        hH.hide();
        fr.hide();
        io.hide();
        et.hide();
        gH.hide();
        gd.hide()
    }
}
;function as() {
    var bn = new oM.MovieClip().set({
        y: 120,
        scale: 860 / 900
    });
    bn.maxWidth = 900;
    bn.maxHeight = 900;
    bn.ks = new oM.MovieClip();
    var aO = new oM.Shape();
    aO.graphics.beginFill("#FFF").drawRect(0, 0, bn.maxWidth, bn.maxHeight);
    bn.ks.addChild(aO);
    bn.ks.cache(0, 0, bn.maxWidth, bn.maxHeight);
    bn.ks.mouseChildren = false;
    bn.jU = new oM.MovieClip();
    var ob = new oM.Shape();
    ob.cache(0, 0, this.maxWidth, this.maxHeight);
    bn.jU.addChild(ob);
    bn.jU.mouseChildren = false;
    bn.addChild(bn.ks, bn.jU);
    bn.nF = function() {
        ob.graphics.clear();
        ob.cache(0, 0, this.maxWidth, this.maxHeight);
    }
    ;
    bn.rk = function() {
        ob.updateCache("source-overlay");
        ob.graphics.clear();
    }
    ;
    bn.dz = function(kO, dS, hy, en, eU) {
        var lg = new oM.Point((hy.x + en.x) / 2,(hy.y + en.y) / 2);
        var kV = new oM.Point((en.x + eU.x) / 2,(en.y + eU.y) / 2);
        ob.graphics.beginStroke(dS).setStrokeStyle(kO, 'round', 'round').moveTo(lg.x, lg.y).quadraticCurveTo(en.x, en.y, kV.x, kV.y);
        this.rk();
    }
    ;
    bn.show = function() {
        ab.setChildIndex(this, ab.children.length - 1);
        this.visible = true;
    }
    ;
    bn.hide = function() {
        this.visible = false;
    }
    ;
    return bn;
}
;function cY() {
    var bn = new oM.Bitmap(kb['timeout']).set({
        regX: 200,
        regY: 200,
        x: 450,
        y: 450,
        visible: false
    });
    bn.show = function() {
        ab.setChildIndex(this, ab.children.length - 1);
        this.set({
            scale: .3,
            alpha: 0,
            visible: true
        });
        var bW = oM.Tween.get(this, {
            override: true
        }).to({
            scale: .5,
            alpha: 1
        }, 500, oM.Ease.elasticOut).wait(3000).to({
            scale: 0,
            alpha: 0,
            visible: false
        }, 400, oM.Ease.backIn).call(this.fH);
    }
    ;
    bn.hide = function() {
        oM.Tween.removeTweens(this);
        this.visible = false;
    }
    ;
    bn.fH = function() {
        var bQ = F('itemAniFinish');
        document.dispatchEvent(bQ);
    }
    ;
    return bn;
}
;function cA() {
    var bn = new oM.MovieClip().set({
        regX: 500,
        regY: 130,
        x: 450,
        y: 450,
        visible: false
    });
    var gz = new oM.Shape();
    gz.graphics.setStrokeStyle(4).beginStroke("#C4C48A").beginFill("#D0D0A8").drawRoundRect(0, 0, 1000, 260, 35);
    var iB = new oM.Bitmap(kb['icomsg']).set({
        x: 10,
        y: 30
    });
    var au = new oM.Text(au,"bold 64px Helvetica","#666").set({
        textAlign: "center",
        lineWidth: 780,
        textBaseline: 'middle',
        x: 600,
        y: 120
    });
    bn.addChild(gz);
    bn.addChild(iB);
    bn.addChild(au);
    bn.shadow = new oM.Shadow("#CCC",2,2,5);
    bn.cache(-5, -5, 1100, 300);
    bn.show = function(aJ) {
        if (this.visible == true) {
            if (au.text == aJ) {
                return;
            }
        }
        this.fL(aJ);
        if (this.cacheID != null) {
            this.updateCache();
        }
        ab.setChildIndex(this, ab.children.length - 1);
        this.set({
            scale: .5,
            alpha: 0,
            visible: true
        });
        var bW = oM.Tween.get(this, {
            override: true
        }).to({
            scale: .7,
            alpha: 1
        }, 500, oM.Ease.elasticOut);
        oM.Ticker.on("tick", this.bM);
    }
    ;
    bn.hide = function() {
        oM.Tween.removeTweens(this);
        this.visible = false;
        this.fL('');
        oM.Ticker.removeEventListener("tick", this.bM);
    }
    ;
    bn.fL = function(aJ) {
        au.text = aJ;
    }
    ;
    bn.bM = function() {
        if (ab.getChildIndex(bn) < (ab.children.length - 1)) {
            ab.setChildIndex(bn, ab.children.length - 1);
        }
    }
    ;
    return bn;
}
;function cs() {
    var hf = 4;
    var bn = new oM.MovieClip().set({
        regX: 200,
        regY: 200,
        x: 900 / 2,
        y: 900 / 2,
        visible: false
    });
    var gL = new oM.Bitmap(kb['sknum1']);
    var gE = new oM.Bitmap(kb['sknum2']);
    var hA = new oM.Bitmap(kb['sknum3']);
    bn.addChild(gL);
    bn.addChild(gE);
    bn.addChild(hA);
    bn.ow = function() {
        if (gL.cacheID == null) {
            gL.cache(0, 0, 400, 400);
            gE.cache(0, 0, 400, 400);
            hA.cache(0, 0, 400, 400);
        }
    }
    ;
    bn.show = function() {
        oM.Tween.removeTweens(this);
        this.ow();
        hf = 4;
        this.visible = true;
        this.im();
    }
    ;
    bn.hide = function() {
        oM.Tween.removeTweens(this);
        this.visible = false;
    }
    ;
    bn.im = function() {
        if (this.visible == true) {
            hf--;
            if (hf > 0) {
                this.oy(hf);
                if (fg.visible == true) {
                    cN.play(9, 100);
                }
                this.set({
                    scale: .5,
                    alpha: 0,
                    visible: true
                });
                var bW = oM.Tween.get(this, {
                    override: true
                }).to({
                    scale: .6,
                    alpha: 1
                }, 500, oM.Ease.elasticOut).wait(500).call(this.im);
            } else {
                if (fg.visible == true) {
                    cN.play(9);
                }
                this.visible = false;
            }
        }
    }
    ;
    bn.oy = function(bY) {
        gL.visible = gE.visible = hA.visible = false;
        switch (bY) {
        case 1:
            gL.visible = true;
            break;
        case 2:
            gE.visible = true;
            break;
        case 3:
            hA.visible = true;
            break;
        }
    }
    ;
    return bn;
}
;function gn() {
    var js = 80;
    var bn = new oM.MovieClip().set({
        visible: false
    });
    var iB = new oM.Bitmap(kb['icoArtisName']).set({
        x: 0,
        y: 0,
        scale: js / 200
    });
    var au = new oM.Text("","bold 60px Helvetica","#333333").set({
        x: js + 20,
        y: 40,
        textBaseline: 'middle'
    });
    bn.addChild(iB);
    bn.addChild(au);
    bn.shadow = new oM.Shadow("#BBB",4,4,10);
    bn.hide = function() {
        oM.Tween.removeTweens(this);
        this.visible = false;
    }
    ;
    bn.fL = function(aJ) {
        au.text = aJ;
        var ml = this.getBounds().width;
        var nY = parseInt((900 - ml) / 2);
        this.x = nY;
        this.y = 130;
    }
    ;
    return bn;
}
;function ef() {
    var bE = new oM.MovieClip();
    var shape = new oM.Shape();
    shape.graphics.beginRadialGradientFill(["#FFF", "#BBB"], [0, 1], 450, 450, 0, 450, 450, 450).drawRect(0, 0, 900, 900);
    bE.addChild(shape);
    bE.cache(0, 0, 900, 900);
    return bE;
}
;function gU() {
    var bn = new oM.MovieClip().set({
        visible: false
    });
    var nH = ef();
    var gi = gn();
    var hN = cs();
    bn.addChild(nH, gi, hN);
    bn.show = function() {
        l();
        ab.setChildIndex(this, ab.children.length - 1);
        gi.fL(ev);
        gi.set({
            y: 160,
            alpha: 0,
            visible: true
        });
        var bW = oM.Tween.get(gi, {
            override: true
        }).wait(500).to({
            y: 200,
            alpha: 1
        }, 400, oM.Ease.kj);
        this.set({
            alpha: 0,
            visible: true
        });
        var bW = oM.Tween.get(this, {
            override: true
        }).to({
            alpha: 1
        }, 300, oM.Ease.linear);
        this.fH();
    }
    ;
    bn.hide = function() {
        if (this.visible == true) {
            gi.visible = false;
            hN.visible = false;
            oM.Tween.removeTweens(this);
            this.set({
                alpha: 1,
                visible: true
            });
            var bW = oM.Tween.get(this, {
                override: true
            }).to({
                alpha: 0,
                visible: false
            }, 300, oM.Ease.linear);
        }
    }
    ;
    bn.fH = function() {
        var bQ = F('itemAniFinish');
        document.dispatchEvent(bQ);
    }
    ;
    bn.nV = function() {
        hN.show();
    }
    ;
    return bn;
}
;function hB() {
    var cd = new Array();
    var bn = new oM.MovieClip().set({
        scale: 900 / 500,
        visible: false
    });
    var eb = 25;
    var ja = 10;
    var eK = eb + ja;
    var fX = 400;
    bn.show = function() {
        if (this.visible == false) {
            l();
            ab.setChildIndex(this, ab.children.length - 1);
            this.removeAllChildren();
            bn.addChild(this.fh());
            for (var i = 0; i < cd.length; i++) {
                if ((i % 2) == 0) {
                    cd[i].x = (-500);
                } else {
                    cd[i].x = 500;
                }
                cd[i].y = (i * eK);
                var bW = oM.Tween.get(cd[i], {
                    override: true
                }).to({
                    x: -210
                }, 50 * (i + 1), oM.Ease.sineOut).call(this.fH);
            }
            cN.kU(15, cd.length, 50);
            this.visible = true;
        }
    }
    ;
    bn.hide = function() {
        this.removeAllChildren();
        oM.Tween.removeTweens(this);
        this.visible = false;
    }
    ;
    bn.fh = function() {
        cd = new Array();
        var fz = bF();
        var fB = new oM.MovieClip().set({
            x: 250,
            y: 50
        });
        for (var i = 0; i < fz.length; i++) {
            var id = fz[i];
            if (al[id].fO == false) {
                var eZ = new oM.MovieClip();
                var bE = this.jw(id);
                eZ.addChild(bE);
                if (al[id].eQ == true) {
                    var bE = this.iE(id);
                    bE.set({
                        x: 212,
                        y: -1
                    });
                    eZ.addChild(bE);
                }
                var bE = this.ij(id);
                bE.set({
                    x: 250
                });
                eZ.addChild(bE);
                var bE = this.oJ(id);
                bE.set({
                    x: 340
                });
                eZ.addChild(bE);
                eZ.cache(-5, -10, 440, 45, 4);
                cd.push(eZ);
                fB.addChild(eZ);
            }
        }
        if ((cd.length * eK) > fX) {
            fB.scale = fX / (cd.length * eK);
        }
        return fB;
    }
    ;
    bn.jw = function(id) {
        var bE = new oM.MovieClip().set({
            visible: true
        });
        var shape = new oM.Shape();
        shape.graphics.setStrokeStyle(4).beginStroke("#333").beginFill("#333").drawRoundRect(0, 0, 200, eb, 12);
        shape.set({
            x: 0,
            y: 0
        });
        var dM = "#FFF";
        if (al[id].da == bD) {
            dM = "#ffd862";
        }
        var bZ = new oM.Text(al[id].pos,"bold 20px Fjalla One",dM).set({
            x: 15,
            y: 15,
            maxWidth: 30,
            textBaseline: 'middle'
        });
        var ee = new oM.Text(al[id].da,"bold 20px Helvetica",dM).set({
            x: 180,
            y: 13,
            textAlign: "right",
            maxWidth: 140,
            textBaseline: 'middle'
        });
        bE.addChild(shape, bZ, ee);
        return bE;
    }
    ;
    bn.iE = function(id) {
        var bE = aw();
        bE.set({
            scale: .8
        });
        bE.fL(al[id].el);
        bE.visible = true;
        return bE;
    }
    ;
    bn.ij = function(id) {
        var bE = new oM.MovieClip().set({
            visible: true
        });
        var shape = new oM.Shape();
        shape.graphics.setStrokeStyle(4).beginStroke("#333").beginFill("#333").drawRoundRect(0, 0, 80, eb, 12);
        var dM = "#FFF";
        if (al[id].da == bD) {
            dM = "#ffd862";
        }
        var bZ = new oM.Text(al[id].fj,"bold 22px Helvetica",dM).set({
            textAlign: "center",
            lineWidth: 100,
            textBaseline: 'middle',
            x: 40,
            y: 13
        });
        bE.addChild(shape, bZ);
        return bE;
    }
    ;
    bn.oJ = function(id) {
        var bE = new oM.MovieClip().set({
            visible: true
        });
        var shape = new oM.Shape();
        shape.graphics.setStrokeStyle(4).beginStroke("#333").beginFill("#333").drawRoundRect(0, 0, 80, eb, 12);
        var dM = "#FFF";
        if (al[id].da == bD) {
            dM = "#ffd862";
        }
        var bZ = new oM.Text(al[id].fa,"bold 22px Helvetica",dM).set({
            textAlign: "center",
            lineWidth: 100,
            textBaseline: 'middle',
            x: 40,
            y: 13
        });
        bE.addChild(shape, bZ);
        return bE;
    }
    ;
    bn.fH = function() {
        var bQ = F('itemAniFinish');
        document.dispatchEvent(bQ);
    }
    ;
    return bn;
}
;function dh() {
    var cd = new Array();
    var bn = new oM.MovieClip().set({
        scale: 900 / 500,
        visible: false
    });
    var kk = new oM.Bitmap(kb['bgwins']);
    kk.cache(0, 0, 500, 500);
    var eb = 25;
    var ja = 10;
    var eK = eb + ja;
    var fX = 400;
    bn.show = function() {
        if (this.visible == false) {
            l();
            ab.setChildIndex(this, ab.children.length - 1);
            this.removeAllChildren();
            bn.addChild(kk);
            var fz = bF();
            if (fz.length > 0) {
                var cD = al[fz[0]];
                if (cD.fO == false) {
                    var aJ = C(L.dJ('THG'), [cD.da]);
                    var lv = new oM.Text(aJ,"bold 28px Helvetica","#333").set({
                        textAlign: "center",
                        maxWidth: 480,
                        textBaseline: 'middle',
                        x: 250,
                        y: 24
                    });
                    bn.addChild(lv);
                }
            }
            this.set({
                alpha: 0,
                visible: true
            });
            var bW = oM.Tween.get(this, {
                override: true
            }).to({
                alpha: 1
            }, 300, oM.Ease.linear).call(this.pk);
            this.visible = true;
        }
    }
    ;
    bn.hide = function() {
        this.removeAllChildren();
        oM.Tween.removeTweens(this);
        this.visible = false;
    }
    ;
    bn.pk = function() {
        bn.addChild(this.fh());
        for (var i = 0; i < cd.length; i++) {
            cd[i].x = (-210);
            cd[i].y = 2000;
            var bW = oM.Tween.get(cd[i], {
                override: true
            }).to({
                y: (i * eK)
            }, 100 * (i + 1), oM.Ease.sineOut).call(this.fH);
        }
        cN.kU(15, cd.length, 100);
    }
    ;
    bn.fh = function() {
        cd = new Array();
        var fz = bF();
        var fB = new oM.MovieClip().set({
            x: 250,
            y: 50
        });
        for (var i = 0; i < fz.length; i++) {
            var id = fz[i];
            if (al[id].fO == false) {
                var eZ = new oM.MovieClip();
                var bE = this.jw(id);
                eZ.addChild(bE);
                var bE = this.iE(id);
                bE.set({
                    x: 210
                });
                eZ.addChild(bE);
                var bE = this.ij(id);
                bE.set({
                    x: 320
                });
                eZ.addChild(bE);
                eZ.cache(-5, -10, 440, 45, 4);
                cd.push(eZ);
                fB.addChild(eZ);
            }
        }
        if ((cd.length * eK) > fX) {
            fB.scale = fX / (cd.length * eK);
        }
        return fB;
    }
    ;
    bn.jw = function(id) {
        var bE = new oM.MovieClip().set({
            visible: true
        });
        var shape = new oM.Shape();
        shape.graphics.setStrokeStyle(4).beginStroke("#333").beginFill("#333").drawRoundRect(0, 0, 200, eb, 2);
        shape.set({
            x: 0,
            y: 0
        });
        var dM = "#FFF";
        if (al[id].da == bD) {
            dM = "#ffd862";
        }
        var bZ = new oM.Text(al[id].pos,"bold 20px Fjalla One",dM).set({
            x: 15,
            y: 14,
            maxWidth: 30,
            textBaseline: 'middle'
        });
        var ee = new oM.Text(al[id].da,"bold 20px Helvetica",dM).set({
            x: 180,
            y: 13,
            textAlign: "right",
            maxWidth: 140,
            textBaseline: 'middle'
        });
        bE.addChild(shape, bZ, ee);
        return bE;
    }
    ;
    bn.iE = function(id) {
        var bE = new oM.MovieClip().set({
            visible: true
        });
        var shape = new oM.Shape();
        shape.graphics.setStrokeStyle(4).beginStroke("#333").beginFill("#333").drawRoundRect(0, 0, 100, eb, 2);
        var dM = "#FFF";
        if (al[id].da == bD) {
            dM = "#ffd862";
        }
        var bZ = new oM.Text(al[id].fj,"bold 22px Helvetica",dM).set({
            textAlign: "center",
            lineWidth: 100,
            textBaseline: 'middle',
            x: 50,
            y: 13
        });
        bE.addChild(shape, bZ);
        return bE;
    }
    ;
    bn.ij = function(id) {
        var bE = new oM.MovieClip().set({
            visible: true
        });
        var shape = new oM.Shape();
        shape.graphics.setStrokeStyle(4).beginStroke("#333").beginFill("#333").drawRoundRect(0, 0, 100, eb, 2);
        var dM = "#FFF";
        if (al[id].da == bD) {
            dM = "#ffd862";
        }
        var bZ = new oM.Text(al[id].fa,"bold 22px Helvetica",dM).set({
            textAlign: "center",
            lineWidth: 100,
            textBaseline: 'middle',
            x: 50,
            y: 13
        });
        bE.addChild(shape, bZ);
        return bE;
    }
    ;
    bn.fH = function() {
        var bQ = F('itemAniFinish');
        document.dispatchEvent(bQ);
    }
    ;
    return bn;
}
;function cT() {
    var bn = new oM.Bitmap(kb['fault']).set({
        regX: 100,
        regY: 100,
        x: gD.maxWidth - 45,
        y: 55,
        scale: .5,
        visible: false
    });
    bn.cache(0, 0, 200, 200);
    bn.on('click', ap);
    bn.show = function() {
        ab.setChildIndex(this, ab.children.length - 1);
        this.visible = true;
    }
    ;
    bn.hide = function() {
        oM.Tween.removeTweens(this);
        this.visible = false;
    }
    ;
    bn.fH = function() {
        var bQ = F('itemAniFinish');
        document.dispatchEvent(bQ);
    }
    ;
    return bn;
}
;function dA() {
    this.jR = function(clip, borderColor) {
        var gy = clip.clone();
        gy.set({
            outline: 2,
            color: borderColor
        });
        gy.shadow = new oM.Shadow("#C79F27",4,4,10);
        return gy;
    }
    ;
    var bn = new oM.MovieClip().set({
        regX: 250,
        regY: 250,
        x: 900 / 2,
        y: 900 / 2,
        visible: false
    });
    var eO = new oM.Bitmap(kb['hitword-star']).set({
        regX: 250,
        regY: 250,
        x: 250,
        y: 250
    });
    var fb = new oM.Bitmap(kb['hitword1']).set({
        regX: 100,
        regY: 100,
        x: 120,
        y: 130
    });
    var fc = new oM.Bitmap(kb['hitword2']).set({
        regX: 100,
        regY: 100,
        x: 440,
        y: 310
    });
    eO.cache(0, 0, eO.getBounds().width, eO.getBounds().height);
    fb.cache(0, 0, fb.getBounds().width, fb.getBounds().height);
    fc.cache(0, 0, fc.getBounds().width, fc.getBounds().height);
    var bZ = new oM.Text("22","bold 40px Helvetica","#333").set({
        textAlign: "center",
        textBaseline: 'middle',
        x: 250,
        y: 220
    });
    var hZ = this.jR(bZ, '#FFF');
    var ee = new oM.Text("22","bold 120px Fjalla One","#FFF").set({
        textAlign: "center",
        textBaseline: 'middle',
        x: 250,
        y: 310
    });
    var iW = this.jR(ee, '#333');
    bn.addChild(eO, fb, fc, hZ, bZ, iW, ee);
    bn.show = function() {
        ab.setChildIndex(this, ab.children.length - 1);
        this.lU();
        this.set({
            scale: 1.6,
            alpha: 1,
            visible: true
        });
        eO.set({
            scale: .7,
            alpha: 0,
            visible: true
        });
        fb.set({
            scale: .2,
            alpha: 0,
            visible: true
        });
        fc.set({
            scale: .2,
            alpha: 0,
            visible: true
        });
        var bW = oM.Tween.get(fb, {
            override: true
        }).to({
            scale: 1,
            alpha: 1
        }, 500, oM.Ease.elasticOut).call(this.ot);
        var bW = oM.Tween.get(fc, {
            override: true
        }).wait(200).to({
            scale: 1,
            alpha: 1
        }, 500, oM.Ease.elasticOut);
        var bW = oM.Tween.get(eO, {
            override: true
        }).wait(400).to({
            scale: 1,
            alpha: 1
        }, 500, oM.Ease.elasticOut);
        var bW = oM.Tween.get(this, {
            override: true
        }).wait(4000).to({
            scale: 0,
            alpha: 0,
            visible: false
        }, 300, oM.Ease.backIn).call(this.fH);
    }
    ;
    bn.hide = function() {
        oM.Tween.removeTweens(this);
        this.visible = false;
    }
    ;
    bn.lU = function() {
        hZ.set({
            text: cj.toUpperCase(),
            visible: false
        });
        bZ.set({
            text: cj.toUpperCase(),
            visible: false
        });
        iW.set({
            text: al[bD].el,
            visible: false
        });
        ee.set({
            text: al[bD].el,
            visible: false
        });
    }
    ;
    bn.ot = function() {
        hZ.visible = true;
        bZ.visible = true;
        iW.visible = true;
        ee.visible = true;
    }
    ;
    bn.fH = function() {
        var bQ = F('itemAniFinish');
        document.dispatchEvent(bQ);
    }
    ;
    return bn;
}
;function cL() {
    var kG = '';
    var bn = new oM.MovieClip().set({
        regX: 6,
        regY: 24,
        visible: false
    });
    bn.mouseChildren = false;
    var hi = new oM.Shape();
    var ta = hi.graphics.beginFill("black").command;
    hi.graphics.drawRect(0, 0, 300, 36);
    hi.set({
        x: 68,
        y: 7
    });
    var sD = new oM.Bitmap(kb['pencil']);
    bn.addChild(hi, sD);
    bn.cache(0, 0, 400, 50);
    hi.visible = sD.visible = false;
    bn.move = function(gm) {
        gm.x = parseInt(gm.x);
        gm.y = parseInt(gm.y);
        if (bn.x != gm.x || bn.y != gm.y) {
            bn.x = gm.x;
            bn.y = gm.y;
            bn.sg();
        }
    }
    ;
    bn.sg = function() {
        var ii = 480 / gD.maxHeight;
        var te = 10 - ((bn.y * ii) / 7);
        te = te.toFixed(1);
        if (bn.rotation != te) {
            bn.rotation = te;
        }
    }
    ;
    bn.nR = function() {
        if (eV != kG) {
            kG = eV;
            ta.style = "#" + eV;
            if (bn.cacheID != null) {
                hi.visible = sD.visible = true;
                bn.updateCache();
                hi.visible = sD.visible = false;
            }
        }
    }
    ;
    bn.show = function() {
        this.visible = true;
    }
    ;
    bn.hide = function() {
        this.visible = false;
    }
    ;
    return bn;
}
;function cu() {
    this.oG = function(dS) {
        var hv = new oM.Shape();
        hv.graphics.beginFill(dS).drawRoundRect(0, 0, 50, 50, 0);
        hv.cache(0, 0, 50, 50);
        return hv;
    }
    ;
    this.rectangle = function(type) {
        var bE = new oM.MovieClip();
        var gb = new oM.Shape();
        if (type == 1) {
            gb.graphics.setStrokeStyle(6).beginStroke('#993').beginFill('#EEB').drawRoundRect(0, 0, 100, 100, 10);
            bE.addChild(gb);
        } else {
            gb.graphics.setStrokeStyle(6).beginStroke('#F63').drawRoundRect(0, 0, 100, 100, 10);
            bE.addChild(gb);
            bE.visible = false;
        }
        return bE;
    }
    ;
    this.circle = function(ratio) {
        var gb = new oM.Shape();
        gb.graphics.beginFill('#333').drawCircle(50, 50, ratio);
        return gb;
    }
    ;
    this.jl = function(ratio) {
        var bE = new oM.MovieClip().set({
            cursor: "pointer",
            mouseChildren: false
        });
        var jy = rectangle(1);
        var eN = rectangle(2);
        var ly = circle(ratio);
        jy.addChild(ly);
        jy.cache(-3, -3, 106, 106);
        eN.cache(-3, -3, 106, 106);
        bE.addChild(jy, eN);
        bE.onMouseOver = function(bQ) {
            eN.visible = true;
        }
        ;
        bE.onMouseOut = function(bQ) {
            eN.visible = false;
        }
        ;
        return bE;
    }
    ;
    this.sj = function(mo) {
        var bE = new oM.MovieClip().set({
            cursor: "pointer",
            mouseChildren: false
        });
        var jy = rectangle(1);
        var eN = rectangle(2);
        var jV = new oM.Bitmap(mo);
        jy.addChild(jV);
        jy.cache(-3, -3, 106, 106);
        eN.cache(-3, -3, 106, 106);
        bE.addChild(jy, eN);
        bE.onMouseOver = function(bQ) {
            eN.visible = true;
        }
        ;
        bE.onMouseOut = function(bQ) {
            eN.visible = false;
        }
        ;
        return bE;
    }
    ;
    this.rG = function() {
        var bE = new oM.MovieClip().set({
            cursor: "pointer",
            mouseChildren: false
        });
        var rZ = new oM.Shape();
        rZ.graphics.setStrokeStyle(3).beginStroke("#CC8").beginFill("#EEC").drawRect(0, 0, 100, 100);
        rZ.alpha = .01;
        var rK = new oM.Bitmap(kb['tool-exit']);
        var mi = new oM.MovieClip().set({
            visible: false
        });
        var sy = new oM.Bitmap(kb['tool-exit']);
        mi.addChild(sy);
        mi.filters = [new createjs.ColorFilter(0,0,0,1,255,102,51,0)];
        mi.cache(0, 0, 100, 100);
        bE.addChild(rZ, rK, mi);
        bE.onMouseOver = function(bQ) {
            mi.visible = true;
        }
        ;
        bE.onMouseOut = function(bQ) {
            mi.visible = false;
        }
        ;
        return bE;
    }
    ;
    var bn = new oM.MovieClip().set({
        scale: .5,
        visible: false
    });
    var mN = new oM.Shape();
    mN.graphics.setStrokeStyle(4).beginStroke("#993").beginFill("#CC5").drawRoundRectComplex(0, 0, 1100, 140, 0, 0, 70, 0);
    mN.cache(0, 0, 1100, 140);
    mN.set({
        x: (-2),
        y: (-2)
    });
    mN.cursor = 'default';
    var lz = sj(kb['tool-cl']).set({
        x: 60,
        y: 18
    });
    lz.on("click", function(bQ) {
        cU();
    });
    var rR = jl(6).set({
        x: 600,
        y: 18
    });
    rR.on("click", function(bQ) {
        eR = 3;
    });
    var sd = jl(12).set({
        x: 710,
        y: 18
    });
    sd.on("click", function(bQ) {
        eR = 6;
    });
    var si = jl(18).set({
        x: 820,
        y: 18
    });
    si.on("click", function(bQ) {
        eR = 9;
    });
    var dp = rG().set({
        x: 950,
        y: 18
    });
    dp.on("click", function(bQ) {
        co();
    });
    bn.addChild(mN, lz, rR, sd, si, dp);
    bn.on("rollover", function(bQ) {
        bn.sJ()
    });
    bn.on("rollout", function(bQ) {
        bn.sK()
    });
    var ju = new Array('F00','F90','FF0','393','09F','04C','F0F','666','B00','963','AA0','272','06A','035','939','000');
    for (var i = 0; i < ju.length; i++) {
        var hz = this.oG('#' + ju[i]);
        var ep = 180 + (50 * (i % 8));
        var fd = 18;
        if (i >= 8) {
            fd = 68;
        }
        hz.set({
            x: ep,
            y: fd,
            cursor: 'pointer'
        });
        hz.dS = ju[i];
        bn.addChild(hz);
        hz.on("click", function(bQ) {
            sY(this.dS);
        });
    }
    bn.sJ = function() {
        lz.on("mouseover", lz.onMouseOver);
        lz.on("mouseout", lz.onMouseOut);
        rR.on("mouseover", rR.onMouseOver);
        rR.on("mouseout", rR.onMouseOut);
        sd.on("mouseover", sd.onMouseOver);
        sd.on("mouseout", sd.onMouseOut);
        si.on("mouseover", si.onMouseOver);
        si.on("mouseout", si.onMouseOut);
        dp.on("mouseover", dp.onMouseOver);
        dp.on("mouseout", dp.onMouseOut);
    }
    ;
    bn.sK = function() {
        lz.off("mouseover", lz.onMouseOver);
        lz.off("mouseout", lz.onMouseOut);
        rR.off("mouseover", rR.onMouseOver);
        rR.off("mouseout", rR.onMouseOut);
        sd.off("mouseover", sd.onMouseOver);
        sd.off("mouseout", sd.onMouseOut);
        si.off("mouseover", si.onMouseOver);
        si.off("mouseout", si.onMouseOut);
        dp.off("mouseover", dp.onMouseOver);
        dp.off("mouseout", dp.onMouseOut);
    }
    ;
    bn.show = function() {
        if (this.visible == false) {
            this.set({
                y: -140,
                visible: true
            });
            var bW = oM.Tween.get(this, {
                override: true
            }).to({
                y: 120
            }, 300, oM.Ease.kj);
        }
    }
    ;
    bn.hide = function() {
        oM.Tween.removeTweens(this);
        if (this.visible == true) {
            this.set({
                y: 0,
                visible: true
            });
            var bW = oM.Tween.get(this, {
                override: true
            }).to({
                y: -140,
                visible: false
            }, 100, oM.Ease.mZ);
        }
        bn.sK();
    }
    ;
    return bn;
}
;function oU() {
    this.lX = function(au) {
        var bE = new oM.MovieClip();
        var fR = 280;
        var iu = 60;
        au = au.toUpperCase();
        bE.word = au;
        var fq = new oM.Shape();
        fq.graphics.setStrokeStyle(2).beginStroke("#993").beginFill("#FFF").drawRect(0, 0, fR, iu);
        fq.set({
            alpha: .9
        });
        bE.je = new oM.Text(au,"bold 38px Helvetica","#333").set({
            textAlign: "center",
            maxWidth: fR - 4,
            textBaseline: 'middle'
        });
        bE.je.set({
            x: (fR / 2),
            y: (iu / 2)
        });
        bE.addChild(fq, bE.je);
        bE.on("click", function(bQ) {
            ps(this);
        });
        bE.on("mouseover", function(bQ) {
            fq.alpha = 1;
        });
        bE.on("mouseout", function(bQ) {
            fq.alpha = .9;
        });
        bE.cursor = "pointer";
        return bE;
    }
    ;
    this.oI = function(dY) {
        for (var i = 0; i < dY.length; i++) {
            if (dY[i] != "") {
                var gC = lX(dY[i]);
                gC.set({
                    x: (280 * i),
                    alpha: .7
                });
                gC.lE = (i + 1);
                fP.addChild(gC);
                gC.set({
                    alpha: 0,
                    visible: true
                });
                var bW = oM.Tween.get(gC, {
                    override: true
                }).wait(100 * (i + 1)).to({
                    alpha: 1
                }, 200, oM.Ease.linear);
            }
        }
    }
    ;
    var bn = new oM.MovieClip().set({
        y: 180,
        visible: false
    });
    var qm = new oM.Shape();
    qm.graphics.setStrokeStyle(2).beginStroke("#993").beginFill("#CC5").drawRect(0, 0, 860, 80);
    var dM = "#FFF";
    var fP = new oM.MovieClip();
    fP.set({
        x: 10,
        y: 10
    });
    bn.addChild(qm);
    bn.addChild(fP);
    bn.show = function(dY) {
        if (dY.join("") != "") {
            fP.removeAllChildren();
            oI(dY);
            ab.setChildIndex(this, ab.children.length - 1);
            this.set({
                y: 0,
                visible: true
            });
            var bW = oM.Tween.get(this, {
                override: true
            }).to({
                y: 120
            }, 300, oM.Ease.kj);
        }
    }
    ;
    bn.hide = function() {
        if (this.visible == true) {
            fP.removeAllChildren();
            oM.Tween.removeTweens(this);
            this.set({
                y: 0,
                visible: true
            });
            var bW = oM.Tween.get(this, {
                override: true
            }).to({
                y: -140,
                visible: false
            }, 100, oM.Ease.mZ);
        }
    }
    ;
    bn.fH = function() {
        var bQ = F('itemAniFinish');
        document.dispatchEvent(bQ);
    }
    ;
    return bn;
}
;function bu() {
    var bn = new oM.MovieClip();
    bn.ku = "333";
    bn.oi = "C90";
    bn.nJ = "FC0";
    bn.gG = "FC0";
    bn.ox = "FFF";
    bn.nZ = "333";
    var gz = new oM.Shape();
    gz.graphics.setStrokeStyle(8).beginStroke("#C33").beginFill("#C33").drawRoundRectComplex(0, 0, 860, 120, 35, 35, 0, 0);
    var ie = new oM.Shape().set({
        x: 150,
        y: 60
    });
    ie.graphics.beginFill("#B33").drawRoundRectComplex(0, 0, 600, 60, 25, 25, 0, 0);
    var kK = new oM.MovieClip().set({
        y: 68
    });
    var iI = new oM.Text('',"bold 36px Helvetica","#333").set({
        textAlign: "left"
    }).set({
        x: 165,
        y: 36,
        textBaseline: 'middle'
    });
    var jv = new oM.Text('',"bold 36px Helvetica","#333").set({
        textAlign: "right"
    }).set({
        x: 735,
        y: 36,
        textBaseline: 'middle'
    });
    bn.addChild(gz, ie, kK, iI, jv);
    bn.cache(-10, -10, 880, 140);
    bn.eL = function(au, dS, gX) {
        if (au != undefined) {
            if (dS == undefined) {
                dS = '333';
            }
            if (gX == undefined) {
                gX = true;
            }
            if (gX == true) {
                au = this.mI(au);
            }
            this.pY(au.toUpperCase(), '#' + dS);
            if (fG == ej && au.indexOf("_") > (-1)) {
                cN.play(12);
            }
        }
    }
    ;
    bn.jx = function(au) {
        if (au != undefined) {
            this.qt(au.toUpperCase());
        }
    }
    ;
    bn.pY = function(au, dS) {
        kK.removeAllChildren();
        var km;
        for (var i = 0; i < au.length; i++) {
            this.jQ(au.charAt(i), dS);
        }
        this.jN();
        this.updateCache();
    }
    ;
    bn.qt = function(au) {
        kK.removeAllChildren();
        var km;
        for (var i = 0; i < au.length; i++) {
            if (cj == au || au.charAt(i) == "_") {
                dS = '#' + this.ku;
            } else {
                dS = '#' + this.oi;
            }
            this.jQ(cj.charAt(i), dS);
        }
        this.jN();
        this.updateCache();
    }
    ;
    bn.jQ = function(lp, dS) {
        km = new oM.Text(lp,"bold 46px Helvetica",dS).set({
            y: 24,
            textBaseline: 'middle'
        });
        if (kK.children.length > 0) {
            km.set({
                x: kK.getBounds().width
            });
        }
        kK.addChild(km);
    }
    ;
    bn.jN = function() {
        if (kK.children.length > 0) {
            kK.set({
                x: parseInt((860 / 2) - (kK.getBounds().width / 2))
            });
        }
    }
    ;
    bn.nL = function(bY) {
        iI.text = L.dJ('TGIMN') + " " + bY.toString();
        this.updateCache();
    }
    ;
    bn.mL = function(bY) {
        jv.text = L.dJ('TGIR') + " " + bY.toString() + "/3";
        this.updateCache();
    }
    ;
    bn.mI = function(au) {
        au = au.split("");
        au = au.join(" ");
        return au;
    }
    ;
    bn.qd = function() {
        kK.visible = true;
        this.updateCache();
    }
    ;
    bn.qJ = function() {
        kK.visible = false;
        this.updateCache();
    }
    ;
    return bn;
}
;function bX() {
    var bn = new oM.MovieClip().set({
        x: 70,
        y: 60,
        scale: .8
    });
    bn.fI = 0;
    bn.active = false;
    var hk;
    var ib = 99;
    var fZ = 0;
    var ly = new oM.Shape();
    ly.graphics.setStrokeStyle(10).beginStroke("#333").beginRadialGradientFill(["#FFF", "#BBB"], [0, 1], -28, -28, 0, 0, 0, 56).drawCircle(0, 0, 56);
    bn.addChild(ly);
    var mp = new oM.Text('',"bold 70px Helvetica","#333").set({
        textAlign: "center",
        lineWidth: 80
    }).set({
        y: 4,
        textBaseline: 'middle'
    });
    bn.addChild(mp);
    bn.cache(-64, -64, 128, 128);
    bn.reset = function() {
        this.fI = fZ;
        this.active = false;
        mp.text = this.fI;
        this.hide();
        clearInterval(hk);
    }
    ;
    bn.start = function(bY) {
        if (typeof bY == "undefined") {
            bY = ib;
        }
        this.fI = parseInt(bY);
        if (bY > fZ) {
            clearInterval(hk);
            hk = setInterval(this.updateInterval, 1000);
            this.active = true;
        } else {
            this.stop();
        }
        this.hO();
        this.show();
    }
    ;
    bn.stop = function() {
        clearInterval(hk);
        this.active = false;
    }
    ;
    bn.updateInterval = function() {
        bn.update();
    }
    ;
    bn.hO = function() {
        if (this.fI > ib) {
            mp.text = ib;
        } else {
            mp.text = this.fI;
        }
        this.updateCache();
    }
    ;
    bn.update = function() {
        if (this.fI > fZ) {
            this.fI--;
            this.hO();
        }
        if (this.fI > fZ && this.fI <= (fZ + 10)) {
            cN.play(3);
        }
        if (this.fI == fZ) {
            var bQ = F('timeOut');
            document.dispatchEvent(bQ);
            this.stop();
        }
    }
    ;
    bn.pg = function(bY) {
        this.fI = parseInt(bY);
        this.hO();
    }
    ;
    bn.show = function() {
        this.visible = true;
    }
    ;
    bn.hide = function() {
        this.visible = false;
    }
    ;
    return bn;
}
;function t(gc, ht) {
    var bn = new oM.MovieClip();
    var qY = new oM.Shape().set({
        x: 12,
        y: 8,
        alpha: .2
    });
    qY.graphics.beginFill("#000").drawRoundRect(0, 0, gc, ht, 35);
    qY.cache(0, 0, gc, ht);
    var gb = new oM.Shape();
    gb.graphics.setStrokeStyle(8).beginStroke("#993").beginLinearGradientFill(["#DDD", "#FFF"], [0, .3], 0, 0, 0, ht).drawRoundRect(0, 0, gc, ht, 35);
    gb.cache(-10, -10, gc + 20, ht + 20);
    bn.addChild(qY, gb);
    bn.setBounds(0, 0, gc, ht);
    return bn;
}
;function ae() {
    var bn = new oM.MovieClip();
    bn.kl = new oM.MovieClip().set({
        x: 12,
        y: 12
    });
    bn.addChild(t(250, ea.maxHeight), bn.kl);
    var hq = new oM.Shape().set({
        x: 12,
        y: 12
    });
    hq.graphics.beginFill("#0F0").drawRect(0, 0, 300, ea.maxHeight - 50);
    bn.kl.mask = hq;
    bn.empty = function() {
        this.kl.removeAllChildren();
    }
    ;
    bn.mV = function(cZ) {
        var mO = aA(cZ);
        cZ.jY = mO;
        this.kl.addChild(mO);
    }
    ;
    bn.mr = function(dw) {
        for (i = this.kl.children.length - 1; i >= 0; i--) {
            var km = this.kl.getChildAt(i);
            if (km != undefined) {
                if (km.name == dw) {
                    this.kl.removeChild(km);
                }
            }
        }
    }
    ;
    bn.mt = function() {
        var fz = bF();
        var km;
        var cZ;
        for (var i = 0; i < fz.length; i++) {
            cZ = al[fz[i]];
            km = this.kl.getChildByName(cZ.da);
            if (km == undefined) {
                this.mV(cZ)
            }
            cZ.oC(i + 1);
            this.ns(cZ);
        }
    }
    ;
    bn.ns = function(cZ) {
        jY = cZ.jY;
        jY.hL.text = cZ.fj;
        jY.oP(cZ.pos);
        jY.lO.fL(cZ.el);
        jY.lO.visible = cZ.eQ;
        jY.ng.visible = cZ.fO;
        jY.mz.visible = false;
        jY.mQ.visible = false;
        if (cZ.da == ev) {
            jY.mz.visible = true;
        } else if (cZ.jf == true) {
            jY.mQ.visible = true;
        }
        jY.kT.updateCache();
        var hS = 90 * (cZ.pos - 1);
        if (jY.y != hS) {
            var bW = oM.Tween.get(jY, {
                override: true
            }).to({
                y: hS
            }, 300, oM.Ease.kj);
        }
    }
    ;
    bn.show = function() {
        this.visible = true;
    }
    ;
    bn.hide = function() {
        this.visible = false;
    }
    ;
    return bn;
}
;function aw() {
    var bn = new oM.MovieClip().set({
        regX: 7,
        regY: 7,
        visible: false
    });
    var jV = new oM.Bitmap(kb['uIcoStar']);
    bn.addChild(jV);
    var au = new oM.Text('',"bold 28px Fjalla One","#FFF").set({
        textAlign: "center",
        lineWidth: 44,
        textBaseline: 'middle',
        x: 25,
        y: 29
    });
    var gy = au.clone();
    gy.set({
        outline: 2,
        color: "#333"
    });
    bn.addChild(gy, au);
    bn.fL = function(hT) {
        if (parseInt(hT) > 0) {
            au.text = gy.text = hT;
        } else {
            au.text = gy.text = '';
        }
    }
    ;
    return bn;
}
;function aA(cZ) {
    var lj = "#C33";
    var bn = new oM.MovieClip().set({
        name: cZ.da,
        scale: .5
    });
    bn.kT = new oM.MovieClip();
    bn.cV = new oM.MovieClip().set({
        alpha: 0
    });
    var hx = new oM.Shape();
    hx.graphics.beginFill("#CCC").drawRect(0, 0, 450, 180);
    bn.cV.addChild(hx);
    bn.cV.cache(0, 0, 450, 180);
    var hq = new oM.Shape();
    hq.graphics.beginFill("#0F0").drawRect(0, 0, 450, 180);
    bn.kT.mask = hq;
    bn.hitArea = hq;
    bn.mouseChildren = false;
    if (cZ.da != bD) {
        bn.cursor = "pointer";
        bn.on("click", function() {
            cN.play(16);
            fl.show(cZ);
        });
        bn.on("mouseover", function() {
            bn.onMouseOver();
        });
        bn.on("mouseout", function() {
            bn.onMouseOut();
        });
    }
    var gJ = new oM.Shape();
    gJ.graphics.setStrokeStyle(4).beginStroke("#BBB").moveTo(0, 180).lineTo(450, 180);
    bn.hg = new oM.Text('',"bold 130px Fjalla One","#CCC").set({
        x: 10,
        y: 100,
        textBaseline: 'middle'
    });
    bn.hL = new oM.Text('',"bold 60px Helvetica","#333").set({
        y: 55,
        textBaseline: 'middle'
    });
    bn.iU = new oM.Text(cZ.da,"bold 60px Helvetica","#666").set({
        y: 120,
        textBaseline: 'middle'
    });
    if (cZ.da == bD) {
        bn.hg.color = lj;
        bn.iU.color = lj;
    }
    bn.mz = new oM.Bitmap(kb['uIcoPen1']).set({
        x: 370,
        y: 20,
        scale: 1.5
    });
    bn.mQ = new oM.Bitmap(kb['uIcoPen2']).set({
        x: 370,
        y: 20,
        scale: 1.5
    });
    bn.ng = new oM.Bitmap(kb['uIcoClock']).set({
        x: 370,
        y: 90,
        scale: 3
    });
    bn.lO = aw();
    bn.lO.set({
        x: 410,
        y: 40,
        scale: 3
    });
    bn.lO.fL('33');
    bn.addChild(bn.cV, bn.kT);
    bn.kT.addChild(gJ, bn.hg, bn.hL, bn.iU);
    bn.kT.addChild(bn.mz, bn.mQ, bn.ng);
    bn.kT.cache(0, 0, 450, 180);
    bn.addChild(bn.lO);
    bn.setBounds(0, 0, 600, 180);
    bn.oP = function(au) {
        bn.hg.text = au;
        var nY = bn.hg.x + bn.hg.getBounds().width + 20;
        bn.iU.set({
            x: nY
        });
        bn.hL.set({
            x: nY
        });
    }
    ;
    bn.onMouseOver = function() {
        bn.cV.alpha = .3;
        bn.hg.color = "#333";
        bn.iU.color = "#333";
        bn.kT.updateCache();
    }
    ;
    bn.onMouseOut = function() {
        bn.cV.alpha = 0;
        bn.hg.color = "#CCC";
        bn.iU.color = "#666";
        bn.kT.updateCache();
    }
    ;
    return bn;
}
;function cE() {
    var bn = new oM.MovieClip();
    bn.lF = null;
    bn.ks = t(1000, ea.maxHeight);
    var qX = 80;
    bn.kq = new oM.MovieClip().set({
        x: 25,
        y: qX
    });
    bn.kr = cl();
    bn.addChild(bn.ks, bn.kq, bn.kr);
    var hY = 870;
    var hq = new oM.Shape().set({
        x: 20,
        y: 75
    });
    hq.graphics.beginFill("#0F0").drawRect(0, 0, 900, hY);
    bn.kq.mask = bn.kr.mask = hq;
    bn.jX = aR().set({
        x: 940,
        y: qX
    });
    bn.addChild(bn.jX);
    bn.kF = an(1000 - 50).set({
        x: 25,
        y: 25
    });
    bn.addChild(bn.kF);
    var sN = false;
    bn.onClick = function() {
        if (bn.lF != null && sN == false) {
            if (bn.lF.lk > 0) {
                cN.play(16);
                var aW = T(dj.gW, bn.lF.lk);
                h(aW);
                sN = true;
                setTimeout(function() {
                    sN = false;
                }, 500);
            }
        }
    }
    ;
    bn.onMouseOver = function() {
        bn.lF = bn.ra();
        if (bn.lF != null) {
            bn.qH(bn.lF);
        }
    }
    ;
    bn.ra = function() {
        var gm = bn.kq.globalToLocal(ab.mouseX, ab.mouseY);
        for (i = 0; i < bn.kq.children.length; i++) {
            var km = bn.kq.getChildAt(i);
            var gg = new createjs.Rectangle(km.x,km.y,km.lb,km.kE);
            if (eH(gm, gg)) {
                return km;
            }
        }
        return null;
    }
    ;
    bn.onMouseOut = function() {
        bn.kr.visible = false;
    }
    ;
    bn.mY = function() {
        var aJ = '';
        aJ = L.dJ('TR') + ":" + bn.kq.children.length;
        if (gI > 0) {
            aJ += "   " + L.dJ('TU') + ":" + gI;
        }
        bn.kF.fL(aJ);
    }
    ;
    bn.lc = function(lK, kJ, jz, nv, iM) {
        var jT = cc();
        jT.lc(lK, kJ, jz, nv, iM);
        this.kq.addChild(jT);
        this.qB();
        this.mY();
    }
    ;
    bn.qB = function() {
        for (i = 0; i < this.kq.children.length; i++) {
            var km = this.kq.getChildAt(i);
            if (km != undefined) {
                if ((i % 2) == 0) {
                    km.x = 0;
                } else {
                    km.x = 450;
                }
                km.y = (120 * parseInt(i / 2));
            }
        }
    }
    ;
    bn.scrollTo = function(bQ) {
        jM = bn.jX.qL();
        var qF = parseInt(bn.kq.children.length / 2) * 120;
        var ii = (qF - hY) / 100;
        var hS = 0 - (jM * ii);
        bn.kq.y = parseInt(hS + qX);
        bn.kr.visible = false;
    }
    ;
    bn.qH = function(fB) {
        bn.kr.x = bn.kq.x + fB.x;
        bn.kr.y = bn.kq.y + fB.y;
        bn.kr.visible = true;
    }
    ;
    bn.empty = function() {
        bn.kq.removeAllChildren();
        bn.kq.y = qX;
        bn.jX.reset();
    }
    ;
    bn.sJ = function() {
        window.addEventListener("wheel", sr, {
            passive: false
        });
        bn.jX.addEventListener("scrollMove", bn.scrollTo, false);
        bn.kq.on("click", bn.onClick);
        bn.kq.on("mouseover", bn.onMouseOver);
        bn.kq.on("mousedown", bn.onMouseOver);
        bn.kq.on("mouseout", bn.onMouseOut);
    }
    ;
    bn.sK = function() {
        window.removeEventListener("wheel", sr, {
            passive: false
        });
        bn.jX.removeEventListener("scrollMove", bn.scrollTo, false);
        bn.kq.off("click", bn.onClick);
        bn.kq.off("mouseover", bn.onMouseOver);
        bn.kq.off("mousedown", bn.onMouseOver);
        bn.kq.off("mouseout", bn.onMouseOut);
    }
    ;
    return bn;
}
;function cc() {
    var bn = new oM.MovieClip();
    bn.lb = 430;
    bn.kE = 100;
    bn.mouseChildren = false;
    var gb = new oM.Shape();
    gb.graphics.setStrokeStyle(4).beginStroke("#CCC").beginFill("#EEE").drawRoundRect(0, 0, bn.lb, bn.kE, 10);
    bn.addChild(gb);
    bn.kq = new oM.MovieClip().set({
        x: 15,
        y: 15
    });
    bn.addChild(bn.kq);
    bn.lk = 0;
    bn.jH = '';
    bn.iO = 0;
    bn.jF = 0;
    bn.lang = "";
    bn.cursor = "pointer";
    bn.lc = function(lK, kJ, jz, nv, iM) {
        bn.lk = lK;
        bn.jH = kJ;
        bn.iO = jz;
        bn.jF = nv;
        bn.lang = iM;
        var jL = new oM.Bitmap(kb['flag-' + bn.lang]).set({
            scale: 32 / 75
        });
        var aJ = bn.lk + ' (' + jz + '/' + nv + ')';
        var ir = new oM.Text(aJ,"bold 26px Helvetica","#333").set({
            x: 40,
            y: 10,
            lineWidth: 200,
            textBaseline: 'middle'
        });
        bn.kq.addChild(jL, ir);
        for (i = 1; i <= nv; i++) {
            var fD = 0;
            if (i <= jz) {
                fD = 1;
            }
            var jW = bv(fD);
            jW.x = (40 * i) - 40;
            bn.kq.addChild(jW);
        }
        bn.cache(-10, -10, bn.lb + 20, bn.kE + 20);
        bn.kq.visible = false;
    }
    ;
    return bn;
}
;function cl() {
    var lb = 430;
    var kE = 100;
    var bn = new oM.MovieClip().set({
        visible: false
    });
    var jj = new oM.Shape();
    jj.graphics.setStrokeStyle(4).beginStroke("#F63").drawRoundRect(0, 0, lb, kE, 10);
    bn.addChild(jj);
    bn.cache(-10, -10, lb + 20, kE + 20);
    return bn;
}
;function bv(fD) {
    var bn = new oM.MovieClip().set({
        y: 35
    });
    if (fD == 1) {
        var iB = new oM.Bitmap(kb['icousu']).set({
            scale: 30 / 64
        });
    } else {
        var iB = new oM.Shape();
        iB.graphics.beginFill("#CCC").drawRect(0, 0, 30, 30);
    }
    bn.addChild(iB);
    return bn;
}
;function bO() {
    cN.play(16);
    if (dW.nq(dW.mj)) {
        aU();
    } else if (dW.nq(dW.lP)) {
        aL();
    }
}
;function aU() {
    er.show({
        fV: L.dJ('TSDLM'),
        fM: [{
            name: L.dJ('TS'),
            path: dn
        }, {
            name: L.dJ('TN')
        }]
    });
}
;function aL() {
    rI();
}
;function rI() {
    tf();
    eS.show();
    dW.show(dW.lZ);
}
;function aQ() {
    var bn = new oM.MovieClip();
    var ep = -2000;
    var gc = eA + 4000;
    var hV = new oM.Shape();
    hV.graphics.beginFill("#444").drawRect(ep, 0, gc, 100);
    var hW = new oM.Shape().set({
        y: 4
    });
    hW.graphics.beginFill("#525252").drawRect(ep, 0, gc, 45);
    bn.iq = new oM.Bitmap(kb['logotop']).set({
        regX: 175,
        x: 960,
        y: -8,
        scale: 1.2
    });
    bn.iq.cache(0, 0, 350, 100);
    var fT = bJ();
    fT.set({
        x: 20,
        y: 15,
        visible: false,
        scale: 1.2
    });
    fT.on("click", bO);
    var nI = sv();
    nI.set({
        x: 20,
        y: 15,
        visible: true,
        scale: 1.2
    });
    bn.addChild(hV, hW, bn.iq, fT, nI);
    bn.show = function() {
        this.visible = true;
    }
    ;
    bn.hide = function() {
        this.visible = false;
    }
    ;
    bn.oX = function() {
        fT.visible = true;
    }
    ;
    bn.oA = function() {
        fT.visible = false;
    }
    ;
    bn.sO = function() {
        nI.visible = true;
    }
    ;
    bn.sn = function() {
        nI.visible = false;
    }
    ;
    bn.rs = function() {
        fT.visible = false;
        nI.visible = false;
    }
    ;
    return bn;
}
;function bJ() {
    gc = 60;
    ht = 60;
    var bn = new oM.MovieClip();
    bn.mouseChildren = false;
    bn.gT = new oM.MovieClip();
    var gb = new oM.Shape();
    gb.graphics.setStrokeStyle(4).beginStroke("#444").beginFill("#555").drawRoundRect(0, 0, gc, ht, 8);
    var jV = new oM.Bitmap(kb['icoback']);
    bn.gT.addChild(gb, jV);
    bn.gT.cache(-5, -5, gc + 10, ht + 10);
    bn.gf = new oM.Shape().set({
        alpha: .1,
        visible: false
    });
    bn.gf.graphics.beginFill("#FFF").drawRoundRect(0, 0, gc, ht, 10);
    bn.gf.cache(0, 0, gc, ht);
    bn.addChild(bn.gT, bn.gf);
    bn.cursor = "pointer";
    bn.on("mouseover", function(e) {
        this.onMouseOver();
    });
    bn.on("mouseout", function(e) {
        this.onMouseOut();
    });
    bn.onMouseOver = function() {
        bn.gf.visible = true;
    }
    ;
    bn.onMouseOut = function() {
        bn.gf.visible = false;
    }
    ;
    bn.show = function() {
        this.visible = true;
    }
    ;
    bn.hide = function() {
        this.visible = false;
    }
    ;
    return bn;
}
;function sv() {
    var bn = new oM.MovieClip();
    bn.lang = 'es';
    var jb = aX();
    jb.addEventListener("onChange", function() {
        bn.pq()
    });
    jb.os(eB);
    bn.addChild(jb);
    bn.pq = function() {
        ao(jb.hC.id);
        gw.mq();
    }
    ;
    return bn;
}
;function ds() {
    var bn = new oM.MovieClip().set({
        visible: false
    });
    bn.hv;
    bn.hn = pu();
    bn.addChild(bn.hn);
    bn.on("click", function(bQ) {
        bQ.preventDefault();
    });
    bn.show = function(gp) {
        if (bn.hv != undefined) {
            bn.removeChild(bn.hv);
        }
        bn.hv = bV(gp);
        bn.hv.set({
            x: (eA / 2),
            y: (ip / 2)
        });
        bn.addChild(bn.hv);
        this.visible = true;
    }
    ;
    bn.hide = function() {
        this.visible = false;
    }
    ;
    return bn;
}
;function bV(gp) {
    var bn = new oM.MovieClip().set({
        regX: 300,
        regY: 90
    });
    bn.setScale = function() {
        bn.scale = fF() ? 3 : 1.8;
    }
    ;
    window.addEventListener('resize', bn.setScale, false);
    bn.setScale();
    bn.hn = new oM.Shape();
    bn.hn.graphics.beginFill("#333").drawRoundRect(0, 0, 600, 180, 15);
    bn.au = new oM.Text(gp.fV,"bold 28px Helvetica","#FFF").set({
        textAlign: "center",
        lineWidth: 600
    }).set({
        x: 300,
        y: 30
    });
    bn.iz = new oM.MovieClip().set({
        x: 20,
        y: 100
    });
    bn.addChild(bn.hn, bn.au, bn.iz);
    var gc = parseInt(560 / gp.fM.length);
    for (i = 0; i < gp.fM.length; i++) {
        var option = gp.fM[i];
        var hx = bi(option.name, gc);
        hx.set({
            x: gc * i
        });
        hx.le = option.path;
        bn.iz.addChild(hx);
    }
    return bn;
}
;function bi(au, gc) {
    ht = 60;
    var bn = new oM.MovieClip();
    bn.mouseChildren = false;
    bn.le;
    bn.gT = new oM.Shape();
    bn.gT.graphics.setStrokeStyle(8).beginStroke("#333").beginFill("#488").drawRoundRect(0, 0, gc, ht, 8);
    bn.gT.cache(0, 0, gc, ht);
    bn.gf = new oM.Shape().set({
        alpha: .1,
        visible: false
    });
    bn.gf.graphics.setStrokeStyle(8).beginStroke("#333").beginFill("#6FF").drawRoundRect(0, 0, gc, ht, 10);
    bn.gf.cache(0, 0, gc, ht);
    bn.au = new oM.Text(au.toUpperCase(),"bold 36px Helvetica","#FFF").set({
        textAlign: "center",
        lineWidth: gc
    }).set({
        x: (gc / 2),
        y: 32,
        textBaseline: 'middle'
    });
    bn.au.cache(0 - (gc / 2), -25, gc, ht);
    bn.addChild(bn.gT, bn.gf, bn.au);
    bn.cursor = "pointer";
    bn.on("click", function(e) {
        this.onClick();
    });
    bn.on("mouseover", function(e) {
        this.onMouseOver();
    });
    bn.on("mouseout", function(e) {
        this.onMouseOut();
    });
    bn.onClick = function() {
        er.visible = false;
        if (typeof bn.le === "function") {
            bn.le();
        }
    }
    ;
    bn.onMouseOver = function() {
        bn.gf.visible = true;
    }
    ;
    bn.onMouseOut = function() {
        bn.gf.visible = false;
    }
    ;
    return bn;
}
;function eF(bQ) {
    if (fS) {
        var hd = fw();
        if (hd != null) {
            if (hd.type === 'text') {
                hd.blur();
            }
        }
    } else {}
}
;function fw() {
    if (document.hasFocus() && document.activeElement !== document.body && document.activeElement !== document.documentElement) {
        return document.activeElement;
    }
    return null;
}
;function sH(dH, rD="#333") {
    var bn = new oM.MovieClip();
    var kq = new oM.MovieClip();
    var pp = bn;
    var maxLength = 16;
    var nh = new oM.Rectangle(0,0,300,44);
    var fA = parseInt(nh.height / 2);
    bn.mouseChildren = false;
    bn.cursor = 'text';
    var nH = new oM.MovieClip();
    var gb = new oM.Shape();
    gb.graphics.setStrokeStyle(3).beginStroke("#CC8").beginFill("#EEC").drawRect(0, 0, nh.width, nh.height);
    nH.addChild(gb);
    var au = new oM.Text('',"34px Helvetica",rD).set({
        x: 10,
        y: fA,
        textBaseline: 'middle'
    });
    kq.addChild(nH, au);
    var hq = new oM.Shape();
    hq.graphics.beginFill("#0F0").drawRect(0, 0, nh.width, nh.height);
    au.mask = hq;
    var kS = bP(au, rD);
    kS.y = fA;
    bn.addChild(kq, kS);
    var fv = document.getElementById('divText');
    if (fv === null) {
        fv = qj();
        document.querySelector('body').appendChild(fv);
    }
    var textInput = document.getElementById('pintuInput_' + dH);
    if (textInput === null) {
        textInput = ql(maxLength);
        textInput.oninput = function() {
            bn.qx();
        }
        ;
        textInput.onblur = function() {
            bn.onBlur();
        }
        ;
        textInput.onkeypress = function(e) {
            bn.onKeyPress(e);
        }
        ;
        fv.appendChild(textInput);
    }
    ab.on("stagemousedown", function(bQ) {
        bn.nl(bQ);
    });
    bn.nl = function(bQ) {
        if (df(pp)) {
            this.nx(1);
        } else {
            this.nx(0);
        }
    }
    ;
    bn.setBounds = function(jk) {
        nh = jk;
        fA = parseInt(nh.height / 2);
        au.y = kS.y = fA;
        var hq = new oM.Shape();
        hq.graphics.beginFill("#0F0").drawRect(0, 0, nh.width, nh.height);
        au.mask = hq;
    }
    ;
    bn.mw = function(fB) {
        kq.removeChild(nH);
        nH = fB;
        kq.addChild(nH);
        kq.setChildIndex(nH, 0);
    }
    ;
    bn.oT = function(bY) {
        maxLength = bY;
        textInput.maxLength = String(maxLength);
    }
    ;
    bn.nk = function() {
        return (document.activeElement === textInput);
    }
    ;
    bn.oW = function() {
        if (au.getBounds() != null) {
            return parseInt(au.getBounds().width);
        }
        return 0;
    }
    ;
    bn.fL = function(aJ) {
        if (textInput.value != aJ) {
            textInput.value = aJ;
        }
        bn.qx();
    }
    ;
    bn.qx = function() {
        au.text = textInput.value;
        this.mX();
        if (bn.nk()) {
            kS.start();
        }
    }
    ;
    bn.mX = function() {
        var gc = this.oW();
        au.x = 10;
        if (gc > (nh.width - 20)) {
            au.x = (nh.width - 10) - gc;
        }
    }
    ;
    bn.empty = function() {
        bn.fL('');
    }
    ;
    bn.focus = function() {
        textInput.disabled = false;
        textInput.readOnly = false;
        textInput.style.visibility = "visible";
        kS.start();
        textInput.focus();
    }
    ;
    bn.blur = function() {
        textInput.blur();
    }
    ;
    bn.nx = function(hd) {
        if (hd == 0) {
            bn.blur();
        } else if (hd == 1) {
            bn.focus();
        } else {
            bn.nx(!bn.nk());
        }
    }
    ;
    bn.onBlur = function() {
        textInput.disabled = true;
        textInput.readOnly = true;
        textInput.style.visibility = "hidden";
        kS.stop();
    }
    ;
    bn.onKeyPress = function(bQ) {
        if (bQ.keyCode == 13) {
            this.dispatchEvent(F('enterKey'));
        }
    }
    ;
    bn.rm = function() {
        return au.text;
    }
    ;
    return bn;
}
;function qj() {
    fv = document.createElement("div");
    fv.name = 'divText';
    fv.style.cssText = "position:absolute;top:0px;left:0px;width:10px;height:80px;overflow:hidden;zIndex:100";
    return fv;
}
;function ql(maxLength) {
    textInput = document.createElement("input");
    textInput.type = "text";
    textInput.maxLength = String(maxLength);
    textInput.disabled = true;
    textInput.readOnly = true;
    textInput.style.cssText = "color:#366;color:transparent;font-size:80px;outline:none;background:none;visibility:hidden;margin:0;padding;0";
    return textInput;
}
;function bP(iQ, dS='#333') {
    var iV;
    var au = iQ;
    var bn = new oM.MovieClip();
    var gJ = new oM.Shape();
    gJ.graphics.setStrokeStyle(4).beginStroke(dS).moveTo(0, -15).lineTo(0, 15);
    bn.addChild(gJ);
    bn.cache(0, -20, 4, 40);
    bn.visible = false;
    bn.start = function() {
        clearInterval(iV);
        iV = setInterval(bn.update, 500);
        bn.qy();
        bn.visible = true;
    }
    ;
    bn.stop = function() {
        clearInterval(iV);
        bn.visible = false;
    }
    ;
    bn.update = function() {
        bn.visible = !bn.visible;
    }
    ;
    bn.qy = function() {
        bn.x = au.x + this.oW();
    }
    ;
    bn.oW = function() {
        try {
            return parseInt(au.getBounds().width);
        } catch (e) {
            return 0;
        }
    }
    ;
    return bn;
}
;function aR() {
    var bn = new oM.MovieClip();
    var po = 0;
    var oR = 126;
    var op = 870;
    var jX = new oM.Shape();
    jX.graphics.beginFill("#CCC").drawRect(0, 0, 32, op);
    var jO = new oM.Shape();
    jO.graphics.setStrokeStyle(1).beginStroke("#993").beginFill("#CC5").drawRect(1, 1, 30, oR);
    bn.addChild(jX, jO);
    cr.onwheel = function(bQ) {
        if (df(gV.ks)) {
            bn.lY(Math.sign(bQ.deltaY));
        }
    }
    ;
    jO.on("mousedown", function(bQ) {
        var mK = jX.globalToLocal(bQ.stageX, bQ.stageY);
        po = mK.y - jO.y;
    });
    jO.on("pressmove", function(bQ) {
        var mK = jX.globalToLocal(bQ.stageX, bQ.stageY);
        bn.lJ(mK.y - po);
    });
    bn.lY = function(jI) {
        bn.lJ(jO.y + (50 * jI));
    }
    ;
    bn.lJ = function(gN) {
        gN = Math.max(gN, 0);
        gN = Math.min(gN, op - oR);
        jO.y = parseInt(gN);
        this.dispatchEvent(F('scrollMove'));
    }
    ;
    bn.reset = function() {
        bn.lJ(0);
    }
    ;
    bn.qL = function() {
        return (jO.y * 100) / (op - oR);
    }
    ;
    return bn;
}
;function an(gc) {
    var bn = new oM.MovieClip();
    bn.maxWidth = gc;
    var gb = new oM.Shape();
    gb.graphics.beginFill("#c7c656").drawRoundRectComplex(0, 0, bn.maxWidth, 40, 15, 15, 0, 0);
    var au = new oM.Text('',"bold 26px Helvetica","#FFF").set({
        x: 20,
        y: 21,
        textBaseline: 'middle'
    });
    bn.addChild(gb, au);
    bn.fL = function(aJ) {
        au.text = aJ;
    }
    ;
    return bn;
}
;function dk() {
    var bn = new oM.MovieClip().set({
        regX: 64,
        regY: 64,
        x: 960,
        y: 600,
        scale: .6,
        visible: false
    });
    bn.jV = new oM.Bitmap(kb['loader']).set({
        regX: 64,
        regY: 64
    });
    bn.jV.cache(0, 0, 128, 128);
    bn.addChild(bn.jV);
    function bz() {
        bn.jV.rotation = bn.jV.rotation + 4;
    }
    ;bn.show = function() {
        oM.Ticker.addEventListener("tick", bz);
        this.visible = true;
    }
    ;
    bn.hide = function() {
        oM.Ticker.removeEventListener("tick", bz);
        this.visible = false;
    }
    ;
    return bn;
}
;function aX() {
    var bn = new oM.MovieClip();
    bn.hC;
    bn.kg = new oM.MovieClip();
    var aO = new oM.Shape();
    aO.graphics.setStrokeStyle(4).beginStroke("#444").beginFill("#555").drawRoundRect(0, 0, 300, 60, 8);
    var jV = new oM.Bitmap(kb['icoplanet']).set({
        x: 12,
        y: 10,
        scale: .6
    });
    bn.kg.au = new oM.Text('',"26px Helvetica","#FFF").set({
        x: 60,
        y: 34,
        textBaseline: 'middle'
    });
    bn.kg.kx = new oM.MovieClip().set({
        x: 250
    });
    var ia = new createjs.Shape().set({
        x: 22,
        y: 30
    });
    ia.graphics.beginFill("#FFF").drawPolyStar(0, 0, 10, 3, 0, 90);
    bn.kg.kx.addChild(ia);
    bn.kg.addChild(aO, jV, bn.kg.au, bn.kg.kx);
    bn.kg.mouseChildren = false;
    bn.gh = [];
    for (i = 0; i < il.length; i++) {
        bn.gh.push({
            id: il[i],
            text: rV[i]
        })
    }
    bn.kW = aS().set({
        y: 64
    });
    bn.kW.qa(bn.gh);
    bn.cursor = "pointer";
    bn.addChild(bn.kg, bn.kW);
    bn.kg.on("click", function() {
        bn.kw()
    });
    bn.kW.addEventListener("onChange", function() {
        bn.oj()
    });
    bn.kw = function() {
        if (bn.kW.visible) {
            bn.kW.hide();
        } else {
            bn.kW.show();
        }
    }
    ;
    bn.oj = function() {
        bn.hC = bn.gh[bn.kW.iL];
        bn.kg.au.text = bn.hC.text;
        bn.dispatchEvent(F('onChange'));
    }
    ;
    bn.os = function(ld) {
        for (i = 0; i < bn.gh.length; i++) {
            if (bn.gh[i].id == ld) {
                bn.hC = bn.gh[i];
                bn.kg.au.text = bn.hC.text;
            }
        }
    }
    ;
    return bn;
}
;function aS() {
    var bn = new oM.MovieClip().set({
        visible: false
    });
    bn.iL;
    bn.sU = 0;
    bn.kC = new oM.MovieClip();
    var aO = new oM.Shape();
    aO.graphics.setStrokeStyle(2).beginFill("#FFF").drawRect(10, 0, 280, 50);
    bn.kC.addChild(aO);
    bn.kC.alpha = .1;
    bn.kW = new oM.MovieClip();
    bn.addChild(bn.kW, bn.kC);
    bn.ny = function() {
        var gm = bn.kW.globalToLocal(ab.mouseX, ab.mouseY);
        if (bn.kW.hitTest(gm.x, gm.y)) {
            var bY = parseInt(gm.y / 50);
            if (bY >= 0 && bY < bn.sU) {
                return bY;
            }
        }
        return -1;
    }
    ;
    bn.mn = function() {
        var gm = bn.kW.globalToLocal(ab.mouseX, ab.mouseY);
        var bY = bn.ny();
        if (bY >= 0) {
            bn.kC.y = bY * 50;
            bn.kC.visible = true;
        } else {
            bn.kC.visible = false;
        }
    }
    ;
    bn.qa = function(iT) {
        bn.sU = iT.length;
        bn.rH(bn.sU * 50);
        for (i = 0; i < iT.length; i++) {
            var km = bn.re(iT[i]).set({
                y: 50 * i
            });
            bn.kW.addChild(km);
        }
    }
    ;
    bn.re = function(v) {
        var km = new oM.MovieClip();
        var aO = new oM.Shape();
        aO.graphics.setStrokeStyle(2).beginStroke("#555").beginFill("#555").drawRect(10, 0, 280, 50);
        var au = new oM.Text(v.text,"26px Helvetica","#FFF").set({
            x: 20,
            y: 26,
            textBaseline: 'middle'
        });
        km.addChild(aO, au);
        km.mouseChildren = false;
        return km;
    }
    ;
    bn.rH = function(ht) {
        var rX = new oM.MovieClip();
        var sp = new oM.Shape();
        sp.graphics.setStrokeStyle(4).beginStroke("#444").beginFill("#555").drawRoundRect(0, 0, 300, ht + 8, 8);
        rX.addChild(sp);
        rX.y = (-4);
        bn.kW.addChild(rX);
    }
    ;
    bn.show = function() {
        ab.addEventListener("stagemousemove", bn.mn);
        ab.addEventListener("stagemouseup", bn.hide);
        bn.kC.visible = false;
        bn.visible = true;
    }
    ;
    bn.hide = function() {
        ab.removeEventListener("stagemousemove", bn.mn);
        ab.removeEventListener("stagemouseup", bn.hide);
        if (df(bn)) {
            bn.iL = bn.ny();
            bn.dispatchEvent(F('onChange'));
        }
        bn.visible = false;
    }
    ;
    return bn;
}
;function dB() {
    this.fadeIn = function(km) {
        if (ea.cacheID != null) {
            this.nD();
        }
        km.visible = true;
        ea.cache(0, 0, ea.maxWidth, ea.maxHeight);
        ea.set({
            alpha: 0,
            visible: true
        });
        var bW = oM.Tween.get(ea, {
            override: true
        }).to({
            alpha: 1
        }, 300, oM.Ease.linear).call(this.nD);
    }
    ;
    this.fadeOut = function(km) {
        if (ea.cacheID != null) {
            this.nD();
        }
        km.visible = true;
        ea.cache(0, 0, ea.maxWidth, ea.maxHeight);
        km.visible = false;
        ea.set({
            alpha: 1,
            visible: true
        });
        var bW = oM.Tween.get(ea, {
            override: true
        }).to({
            alpha: 0
        }, 300, oM.Ease.linear).call(this.nD);
    }
    ;
    this.nD = function() {
        ea.visible = true;
        ea.uncache();
    }
}
;function pu() {
    var hn = new oM.Shape().set({
        alpha: .3
    });
    hn.graphics.beginFill("#000").drawRect(-2000, 0, eA + 4000, ip + 4000);
    hn.on("mouseover", function(bQ) {
        bQ.stopPropagation();
    });
    hn.on("mouseout", function(bQ) {
        bQ.stopPropagation();
    });
    return hn;
}
;function qN() {
    var bn = new oM.MovieClip().set({
        visible: false
    });
    bn.hn = pu();
    bn.qI = qg();
    bn.addChild(bn.hn, bn.qI);
    bn.qI.db.on("click", function() {
        cN.play(16);
        bn.hide();
    });
    bn.show = function(cZ) {
        if (cZ.da != '') {
            bn.qI.qZ(cZ);
            ab.setChildIndex(this, ab.children.length - 1);
            this.visible = true;
        }
    }
    ;
    bn.hide = function() {
        this.visible = false;
    }
    ;
    return bn;
}
;function qg() {
    var bn = new oM.MovieClip();
    var cD;
    bn.setScale = function() {
        bn.scale = fF() ? 1.6 : 1;
    }
    ;
    window.addEventListener('resize', bn.setScale, false);
    bn.setScale();
    bn.setBounds(0, 0, 600, 500);
    O(bn);
    var qY = new oM.Shape().set({
        x: 12,
        y: 8,
        alpha: .2
    });
    qY.graphics.beginFill("#000").drawRoundRect(0, 0, 600, 500, 35);
    qY.cache(0, 0, 600, 500);
    var ri = new oM.Shape();
    ri.graphics.setStrokeStyle(4).beginStroke("#DDD").beginFill("#333").drawRoundRect(0, 0, 600, 500, 35);
    bn.db = qr();
    bn.db.x = 580;
    bn.db.y = 20;
    var jq = 80;
    bn.ff = j("VOTE KICK").set({
        x: jq,
        y: 200
    });
    bn.ff.on("click", function() {
        bn.pZ();
    });
    bn.hb = j("IGNORE").set({
        x: jq,
        y: 350
    });
    bn.hb.on("click", function() {
        bn.qf();
    });
    bn.addChild(qY, ri, bn.ff, bn.hb, bn.db);
    var bZ = new oM.Text('',"bold 60px Helvetica","#FFF").set({
        textAlign: "center",
        maxWidth: 580,
        x: 300,
        y: 70
    });
    bn.addChild(bZ);
    bn.qZ = function(cZ) {
        cD = cZ;
        bZ.text = cD.da;
    }
    ;
    bn.pZ = function() {
        cN.play(16);
        var aW = T(dj.pP, cD.da);
        h(aW);
    }
    ;
    bn.qf = function() {
        cN.play(16);
        na(cD.da);
    }
    ;
    return bn;
}
;function qr() {
    var bn = new oM.MovieClip();
    bn.cursor = "pointer";
    var qY = new oM.Shape().set({
        x: 12,
        y: 8,
        alpha: .2
    });
    qY.graphics.beginFill("#000").drawCircle(0, 0, 40);
    var db = new oM.Shape();
    db.graphics.setStrokeStyle(4).beginStroke("#DDD").beginFill("#333").drawCircle(0, 0, 40);
    bn.addChild(qY, db);
    var pF = new oM.Shape();
    pF.graphics.setStrokeStyle(8).beginStroke("#DDD").moveTo(-17, -17).lineTo(17, 17);
    var qi = new oM.Shape();
    qi.graphics.setStrokeStyle(8).beginStroke("#DDD").moveTo(17, -17).lineTo(-17, 17);
    bn.addChild(pF, qi);
    return bn;
}
;function qs() {
    if (fS == true && document.activeElement.type == 'text') {
        return true;
    }
    return false;
}
