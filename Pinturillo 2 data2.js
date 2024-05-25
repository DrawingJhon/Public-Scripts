function cn(dQ) {
    if (dQ.search("/") == 0) {
        return h(dQ.substr(1))
    }
    dQ = aj(dQ.trim());
    if (dQ != '') {
        var aW = T(dj.nn, dQ);
        return h(aW)
    }
    return 0;
}
;function bL(dH) {
    var dH = dH;
    var sB = 20;
    var margin = 24;
    var qO = 550;
    var bn = new oM.MovieClip();
    bn.mouseChildren = false;
    bn.kq = new oM.MovieClip().set({
        x: margin,
        y: margin
    });
    bn.addChild(t(600, ea.maxHeight), bn.kq);
    var hq = new oM.Shape().set({
        x: margin,
        y: margin
    });
    hq.graphics.beginFill("#0F0").drawRect(0, 0, qO, ea.maxHeight - 50);
    bn.kq.mask = hq;
    bn.pH = function() {
        var gT = new oM.MovieClip();
        var gb = new oM.Shape();
        gb.graphics.setStrokeStyle(3).beginStroke("#CC8").beginFill("#EEC").drawRect(0, 0, qO, 40);
        gT.addChild(gb);
        return gT;
    }
    ;
    var k = sH(dH).set({
        x: margin,
        y: ea.maxHeight - 70
    });
    k.setBounds(new oM.Rectangle(0,0,qO,40));
    k.mw(bn.pH());
    k.oT(60);
    k.on("enterKey", function(bQ) {
        bn.onKeyPress();
    }, false);
    bn.addChild(k);
    bn.on('mousedown', function(bQ) {
        bn.onClick();
    });
    bn.onClick = function() {
        k.nx(1);
    }
    ;
    bn.onKeyPress = function(bQ) {
        cn(k.rm());
        k.empty();
    }
    ;
    bn.kz = function(eu, dQ) {
        eu = aj(eu.trim());
        dQ = aj(dQ.trim());
        dQ = this.nd(dQ);
        if (eu != '' && dQ != '') {
            this.mE(eu, dQ);
            this.J();
        }
    }
    ;
    bn.mE = function(eu, dQ) {
        if (eu == bD) {
            dS = "#44C"
        } else {
            dS = "#4A0"
        }
        eu = eu + ': ';
        dQ = eu + dQ;
        var ke = new oM.MovieClip();
        var mf = new oM.Text(eu,"bold 36px Helvetica",dS).set({
            lineWidth: qO
        });
        var kI = new oM.Text(dQ,"bold 36px Helvetica","#333").set({
            lineWidth: qO
        });
        if (bn.kq.children.length > 0) {
            ke.set({
                y: parseInt(bn.kq.getBounds().height + 15)
            });
        }
        ke.addChild(kI, mf);
        bn.kq.addChild(bn.so(ke));
    }
    ;
    bn.so = function(fB) {
        var kE = parseInt(fB.getBounds().height);
        fB.cache(0, 0, qO, kE);
        fB.setBounds(0, 0, qO, kE);
        return fB;
    }
    ;
    bn.ko = function(dQ, fD) {
        if (typeof fD == "undefined") {
            fD = 0;
        }
        dQ = aj(dQ.trim());
        if (dQ != '') {
            this.lx(dQ, fD);
            this.J();
        }
    }
    ;
    bn.lx = function(dQ, fD) {
        var ke = new oM.MovieClip();
        if (fD > 0) {
            dQ = "     " + dQ;
            ke.addChild(new oM.Bitmap(kb['icoChat' + fD]));
        } else {
            dQ = "· " + dQ;
        }
        var kI = new oM.Text(dQ,"bold 36px Helvetica","#D63").set({
            lineWidth: qO
        });
        if (bn.kq.children.length > 0) {
            ke.set({
                y: parseInt(bn.kq.getBounds().height + 15)
            });
        }
        ke.addChild(kI);
        bn.kq.addChild(bn.so(ke));
    }
    ;
    bn.J = function(eu, dQ) {
        if (bn.kq.children.length >= sB) {
            this.oD(bn.kq.children.length - sB);
            this.rN();
        }
        this.nu();
    }
    ;
    bn.nu = function() {
        if (bn.kq.children.length > 0) {
            var mG = k.y - margin;
            if (parseInt(bn.kq.getBounds().height) > mG) {
                bn.kq.y = mG - parseInt(bn.kq.getBounds().height);
            } else {
                bn.kq.y = margin;
            }
        }
    }
    ;
    bn.oD = function(oe) {
        for (i = (oe - 1); i >= 0; i--) {
            var km = bn.kq.getChildAt(i);
            if (km != undefined) {
                bn.kq.removeChild(km);
            }
        }
    }
    ;
    bn.rN = function() {
        if (bn.kq.children.length > 0) {
            var nf = bn.kq.getChildAt(0).y;
            for (i = 0; i < bn.kq.children.length; i++) {
                bn.kq.getChildAt(i).y = parseInt(bn.kq.getChildAt(i).y - nf);
            }
        }
    }
    ;
    bn.nd = function(aJ) {
        var mG = 26;
        jZ = aJ.split(" ");
        lf = new Array();
        for (var ft in jZ) {
            hG = jZ[ft];
            while (hG.length > mG) {
                lf.push(hG.substr(0, mG));
                hG = hG.substr(mG)
            }
            lf.push(hG);
        }
        return lf.join(' ');
    }
    ;
    bn.empty = function() {
        bn.kq.removeAllChildren();
        bn.kq.y = margin;
        k.empty();
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
;Object.assign(jr, {
    71: mD,
    72: dE,
    100: cI,
    101: lN,
    102: pe,
    103: lC,
    104: nT,
    105: nP,
    106: aV,
    107: bx,
    109: pn,
    110: mH,
    111: oV,
    112: cW,
    113: me,
    74: cw,
    75: dm,
    76: cJ,
    77: de,
    78: bj,
    79: cv,
    80: ct,
    81: cS,
    82: dc,
    83: cR,
    84: aY,
    85: bg,
    86: mv,
    87: od,
    88: rS
});
function mD(v) {
    aB();
}
;function dE(v) {
    var aW = T(dj.pb, v[1]);
    h(aW);
}
;function cv(v) {
    if (v[1] != bD) {
        bo(v[1]);
        if (hD != undefined) {
            hD.mt();
        }
    }
}
;function cI(v) {
    if (cb == v[1] && ey == hl) {
        if (v[2] == "MT") {
            cQ(v[3], v[4]);
            v[2] = "LT"
        }
        if (v[2] == "LT") {
            dC(v[5])
        }
        if (v[2] == "CL") {
            sk();
        }
    }
}
;function lN(v) {
    if (cb == v[1]) {
        hs.start(v[2]);
    }
}
;function pe(v) {
    if (cb == v[1]) {
        mF();
    }
}
;function lC(v) {
    if (gO != undefined) {
        gO.ko(v[1]);
    }
}
;function nT(v) {
    if (cb == v[1]) {
        cj = v[3].toUpperCase();
        ai();
        aC(eY);
        if (v[2] == "0" || v[2] == "2") {
            G();
            if (fm.visible == false) {
                setTimeout(function() {
                    H(hE);
                }, 1000);
            }
        } else if (v[2] == "3") {
            G();
            aJ = L.dJ('TEPHSDJ');
            fm.show(aJ);
        }
        hD.mt();
    }
}
;function nP(v) {
    if (cb == v[1]) {
        var dw = v[2];
        al[dw].iZ(parseInt(v[3]));
        if (parseInt(v[4]) == 1 && al[dw].eQ == false) {
            al[dw].kL(parseInt(v[5]));
            var aJ = C(L.dJ('TALP'), [dw]);
            if (gO != undefined) {
                gO.ko(aJ, 1);
            }
            if (dw == bD) {
                gZ.eL(cj, gZ.ox, false);
                fr.hide();
                H(io);
                cN.play(2);
            } else {
                cN.play(4);
            }
        }
        hD.mt();
    }
}
;function aV(v) {
    cb = v[1];
    ev = v[2];
    gZ.eL(v[3], gZ.gG);
    if (parseInt(v[4]) > 0) {
        hs.start(parseInt(v[4]));
        if (ev != bD && hs.active == true) {
            aC(hl);
        }
    }
    bC(v[5]);
    hD.mt();
}
;function bx(v) {
    cB(v);
}
;function pn(v) {
    if (cb == v[1]) {
        ma(v[1]);
    }
}
;function mH(v) {
    if (cb == v[1]) {
        cj = v[2].toUpperCase();
    }
}
;function oV(v) {
    if (cb == v[1]) {
        gR = v[2].toUpperCase();
        if (ev == bD) {
            gZ.jx(v[2])
        } else {
            gZ.eL(v[2], gZ.gG)
        }
    }
}
;function cW(v) {
    var aJ = '';
    switch (v[1]) {
    case "2":
        aJ = L.dJ('TEPHSP');
        cN.play(14);
        break;
    case "1":
        aJ = L.dJ('TEPHCST');
        break;
    default:
        aJ = L.dJ('TPI');
    }
    G();
    fm.show(aJ);
}
;function me(v) {
    if (gO != undefined && cb == v[1] && v.length == 4) {
        var aJ = C(L.dJ('TLFHSE'), [v[2], v[3]]);
        gO.ko(aJ);
        cN.play(13);
    }
}
;function mv(v) {
    if (cb == v[1]) {
        if (bD == v[2]) {
            lT(v.slice(4, 7));
        }
    }
}
;function od(v) {
    mW(v[1], parseInt(v[2]), v[3]);
}
;function cw(v) {
    var dQ = aE(v, 3);
    if (fQ.kt(v[1]) == false) {
        if (gO != undefined) {
            gO.kz(v[1], dQ);
        }
    }
}
;function dm(v) {
    eP(v[1]);
    if (gV != undefined) {
        gV.mY();
    }
}
;function de(v) {
    if (v[1] == bD) {
        fE = parseInt(v[2]);
        if (parseInt(v[2]) == it) {
            dW.show(dW.lP);
        } else {
            dv();
            dW.show(dW.mj);
        }
    } else {
        if (parseInt(v[2]) == fE) {
            bs(v[1]);
            var aJ = C(L.dJ('THEELS'), [v[1]]);
            if (gO != undefined) {
                gO.ko(aJ);
            }
            cN.play(1);
            hD.mt();
        }
    }
}
;function bj(v) {
    if (v[1] == "2") {
        er.show({
            fV: L.dJ('TCI'),
            fM: [{
                name: "OK"
            }]
        });
        be(2);
    }
}
;function ct(v) {
    if (v[1] != bD) {
        bo(v[1]);
        if (hD != undefined) {
            hD.mt();
        }
    }
}
;function rS(v) {
    if (v[1] == bD && v[2] == fE) {
        dW.oc();
        er.show({
            fV: L.dJ('THK'),
            fM: [{
                name: 'OK',
                path: function() {
                    dW.show(dW.mU);
                }
            }]
        });
    }
}
;function dc(v) {
    if (v[6] == 1) {
        cG(v);
    }
}
;function cR(v) {}
;var ge = 0;
var cb = '';
var cj = '';
var gR = '';
var ev = '';
var pv;
var hI = 1;
var nB = 2;
var ej = 3;
var fG = hI;
var fQ = new nr();
function mF() {
    if (al[bD].fO == false) {
        document.dispatchEvent(F(py.qV));
    }
    kX();
    hD.mt();
    gZ.qJ();
    hs.hide();
    sk();
    H(hH);
}
;function ap() {
    if (fG == ej) {
        var aW = T(dj.md, cb);
        h(aW);
        fr.hide();
    }
}
;function cU() {
    var aW = T(dj.lu, cb, 'CL');
    h(aW);
    sk();
}
;function co() {
    er.show({
        fV: L.dJ('TPDCT'),
        fM: [{
            name: L.dJ('TS'),
            path: cf
        }, {
            name: L.dJ('TN')
        }]
    });
}
;function ps(ki) {
    cN.play(16);
    gd.hide();
    var aW = T(dj.mB, ki.lE);
    h(aW)
}
;function lT(dY) {
    if (dY.join("") != "") {
        sk();
        hD.mt();
        cj = "?";
        gZ.jx(cj);
        gd.show(dY);
    }
}
;function ay(d) {
    fE = parseInt(d);
    gZ.nL(fE);
}
;function bC(ka) {
    ge = parseInt(ka);
    gZ.mL(ge);
}
;function dv() {
    fG = hI;
    dW.qq(dW.mj);
    gO = fY;
    gO.empty();
    cz();
    bH();
    gZ.eL('', gZ.nJ);
    hD.empty();
    al = {};
    bs(bD);
    hD.mt();
    hc.show(L.dJ('TEAST'));
    hs.reset();
    document.addEventListener('itemAniFinish', ah, false);
    document.addEventListener('timeOut', aM, false);
}
;function aI() {
    if (fG != hI) {
        G();
    }
    fG = hI;
    if (gO == fY) {
        gO = undefined;
    }
    cF();
    iA();
    l();
    hD.empty();
    al = {};
    hc.hide();
    hs.stop();
    document.removeEventListener('itemAniFinish', ah, false);
    document.removeEventListener('timeOut', aM);
    clearTimeout(pv);
}
;function mW(ig, jA, lo) {
    fG = nB;
    cb = ig;
    ev = lo;
    if (jA < ge) {
        nm();
    } else if (jA > ge) {
        lW();
    }
    lM();
    if (al[ev]) {
        al[ev].oO(true);
    }
    hD.mt();
    bC(jA);
    hs.stop();
    hs.pg(99);
    cj = "?";
    if (bD != ev) {
        gZ.eL(cj, gZ.gG);
    }
    gZ.qd();
    l();
    hc.hide();
    sk();
    bH();
    var aJ = C(L.dJ('TLTDA'), [ev]);
    if (gO != undefined) {
        gO.ko(aJ, 2);
    }
    iA();
    H(fg);
    document.dispatchEvent(F(py.qG));
}
;function nm() {
    for (var fK in al) {
        al[fK].oQ();
    }
}
;function lW() {
    for (var fK in al) {
        al[fK].nX();
    }
}
;function lM() {
    for (var fK in al) {
        al[fK].mW();
    }
}
;function kX() {
    for (var fK in al) {
        al[fK].eQ = false;
    }
}
;function ma(ig) {
    if (cb == ig) {
        aC(eY);
        if (ev == bD) {
            if (cj.length <= 1) {
                return false;
            }
            gR = '';
            gZ.jx(cj)
        } else {
            if (gR.length <= 1) {
                return false;
            }
            cj = '';
            gZ.eL(gR, gZ.gG);
        }
        for (var fK in al) {
            al[fK].gq(false);
        }
        hD.mt();
        mA();
        gd.hide();
        return true;
    }
    return false;
}
;function mA() {
    if (fg != undefined) {
        fg.nV();
    }
    pv = setTimeout(mb, 3000);
}
;function mb() {
    if (dW.nq(dW.mj)) {
        fG = ej;
        hs.start();
        if (ev == bD) {
            aC(eo);
            gH.show();
        } else {
            aC(hl);
            fr.show();
        }
        if (fg != undefined) {
            fg.hide();
        }
    }
}
;function G() {
    if (fG != hI) {
        fG = hI;
        aC(eY);
        gH.hide();
        et.hide();
        fr.hide();
        document.dispatchEvent(F(py.pL));
    }
    hs.stop();
    ai();
}
;function aM(e) {
    if (fG == ej) {
        G();
        if (al[bD].eQ == false) {
            gZ.eL(cj, gZ.gG, false);
        }
        if (al[bD].eQ == false && ev != bD) {
            H(gx);
            cN.play(5);
        }
        setTimeout(function() {
            H(hE);
        }, 1000);
    }
}
;function bF() {
    for (var fK in al) {
        al[fK].or();
    }
    var fz = Object.keys(al).sort(aG());
    fz.reverse();
    return fz;
}
;function aG() {
    return function(a, b) {
        if (al[a].fj != al[b].fj) {
            return al[a].fj - al[b].fj;
        } else if (al[a].fa != al[b].fa) {
            return al[a].fa - al[b].fa;
        } else {
            return al[b].jB.localeCompare(al[a].jB);
        }
    }
}
;function bs(da) {
    if (!(da in al)) {
        al[da] = new ix(da);
    }
}
;function bo(da) {
    if (da in al) {
        delete al[da];
    }
    if (hD != undefined) {
        hD.mr(da);
    }
}
;function na(dw) {
    if (dw != bD) {
        if (fQ.kt(dw) == false) {
            fQ.np(dw);
        } else {
            fQ.nb(dw);
        }
    }
}
;function dn() {
    if (typeof sX !== 'undefined') {
        dW.oc();
        eS.show();
        qp = rJ = rI;
        setTimeout(rj, 1000)
    } else {
        rI();
    }
}
;function cf() {
    if (fG == ej) {
        if (ev == bD) {
            l();
            fm.show(L.dJ('TEPHCST'));
            G();
            var aW = T(dj.nS, cb);
            h(aW);
        }
    }
}
;function cB(a) {
    bs(a[1]);
    al[a[1]].iZ(a[2]);
    al[a[1]].gs(a[3]);
    if (parseInt(a[6]) > 0) {
        al[a[1]].kL(a[6]);
        al[a[1]].gq(false);
    }
    if (parseInt(a[4]) == 0) {
        al[a[1]].gq(false);
    }
    al[a[1]].fa = a[5];
    hD.mt();
}
;function cG(v) {
    if (v[3] == 'IN') {
        v[3] = 'EN';
    }
    gV.lc(v[1], v[2], parseInt(v[5]), parseInt(v[4]), v[3]);
}
;var cK = {
    x: 0,
    y: 0
};
var iY = 3;
var kB = '000000';
var eR = iY;
var eV = kB;
var bG = [];
var dP = 0;
var iw = false;
var qo;
var eY = 0;
var hl = 1;
var eo = 2;
var ey = eY;
var gr = '#mySketcher';
function fC() {
    if (ab.mouseInBounds == true) {
        return true;
    }
    return false;
}
;function qC() {
    if (ab != undefined) {
        if (ey == eo) {
            bh();
        } else if (ey == hl) {
            dg();
        }
    }
}
;function ci(bQ) {
    cK = gD.globalToLocal(parseInt(bQ.stageX), parseInt(bQ.stageY));
}
;function bh() {
    if (iw == true) {
        cC({
            x: cK.x,
            y: cK.y
        });
    }
    if (bG[0] != undefined) {
        dP = bG[0].length - 4;
        if (bG[0].length > 4) {
            aF()
        }
        if (dP >= bG[0].length) {
            dP = 0
        }
        if (bG[0].length > 160) {
            var ed = [eR, eV, R(-4), R(-3), R(-2), R(-1), R(0), R(1)];
            bU();
            bG.push(ed);
            dP = 0
        }
    }
}
;function dg() {
    if (bG[0] != undefined) {
        if (dP == 0) {
            eR = parseInt(bG[0][0]);
            sY(bG[0][1]);
        }
        et.show();
        aF();
        if (dP >= bG[0].length) {
            dP = 0;
            bG.splice(0, 1);
        }
    } else {
        et.hide();
    }
}
;function aC(mode) {
    ey = mode;
    if (ey == eo) {
        gD.cursor = 'none';
        sR();
    } else {
        ab.enableMouseOver(lD);
        gD.cursor = null;
        lL();
    }
}
;function nj(bQ) {
    ci(bQ);
    if (et.visible == true) {
        et.move(cK);
        ab.update();
    }
}
;function mx(bQ) {
    ci(bQ);
    aZ();
    if (ey == eo) {
        aF();
        bU()
    }
}
;function ss(bQ) {
    ci(bQ);
    if (ey == eo && fG == ej) {
        cP();
        lQ();
        aF();
    }
}
;function pS() {
    ab.enableMouseOver(4);
    if (fS == false) {
        et.move(cK);
        et.show();
    }
}
;function qc() {
    ab.enableMouseOver(lD);
    et.hide();
}
;function sR() {
    if (ab != undefined) {
        ab.addEventListener("stagemousemove", nj);
        ab.addEventListener("stagemouseup", mx);
        gD.addEventListener("mousedown", ss);
        gD.addEventListener("rollover", pS);
        gD.addEventListener("rollout", qc);
    }
}
;function lL() {
    if (ab != undefined) {
        ab.removeEventListener("stagemousemove", nj);
        ab.removeEventListener("stagemouseup", mx);
        gD.removeEventListener("mousedown", ss);
        gD.removeEventListener("rollover", pS);
        gD.removeEventListener("rollout", qc);
    }
}
;function cz() {
    clearInterval(qo);
    qo = setInterval(qC, (1000 / 30));
    sk();
}
;function cF() {
    clearInterval(qo);
    aC(eY);
    sk();
}
;function bH() {
    eR = iY;
    sY(kB);
}
;function sk() {
    ai();
    if (ab != undefined && gD != undefined) {
        gD.nF();
    }
}
;function ai() {
    bG = new Array();
    dP = 0;
}
;function cP() {
    if (ey == eo && fG == ej) {
        iw = true;
    }
}
;function aZ() {
    iw = false;
}
;function aF() {
    if (ey != eY) {
        if (R(0) != null) {
            if (dP == 0) {
                dP = 2;
            }
            var eU = new oM.Point(R(0),R(1));
            var en = eU.clone();
            var hy = eU.clone();
            if (dP >= 4) {
                en = new oM.Point(R(-2),R(-1));
            }
            if (dP >= 6) {
                hy = new oM.Point(R(-4),R(-3));
            }
            gD.dz(eR * 2, '#' + eV, hy, en, eU);
            if (ey == hl && et.visible == true) {
                et.move(eU);
            }
            dP = dP + 2;
        }
    }
}
;function R(ft) {
    if (bG[0] != undefined) {
        if (bG[0].length >= 2) {
            if (dP + ft < bG[0].length) {
                return bG[0][dP + ft];
            }
        }
    }
    return null;
}
;function ca() {
    if (dP >= bG[0].length - 2) {
        bG.splice(0, 1);
        dP = 0
    }
}
;function cO() {
    var ed = bG[0];
    var kD = ed.splice(0, 180);
    var dU = new Array();
    for (var i = 0; i < kD.length; i = i + 1) {
        dU.push(aD(kD[i]))
    }
    return dU.join("");
}
;function cQ(hj, ih) {
    bG.push(new Array());
    bG[bG.length - 1][0] = parseInt(hj);
    ih = bA(ih, 6);
    bG[bG.length - 1][1] = ih;
}
;function dC(hj) {
    var kv = new Array();
    var hM;
    for (var i = 0; i < hj.length; i = i + 2) {
        hM = parseInt(hj.substr(i, 2), 36);
        hM = hM * (gD.maxWidth / 480);
        kv.push(hM);
    }
    if (bG.length == 0) {
        bG.push(new Array());
        bG[bG.length - 1][0] = iY;
        bG[bG.length - 1][1] = kB;
    }
    bG[bG.length - 1] = bG[bG.length - 1].concat(kv);
}
;function bU() {
    if (bG[0] != undefined) {
        if (bG[0].length >= 4) {
            var dU = new Array();
            var ed = bG[0];
            var param = 'MT';
            var lH = ed[0];
            var pi = ed[1];
            ed.splice(0, 2);
            while (ed.length > 0) {
                dU = ed.splice(0, 180);
                dU = ba(dU);
                var aW = T(dj.lu, cb, param, lH, pi, dU.join(""));
                h(aW);
                param = 'LT'
            }
        }
        bG.shift();
    }
}
;function lQ() {
    dP = 0;
    bG.push([eR, eV]);
    cC({
        x: cK.x,
        y: cK.y
    });
}
;function cC(fu) {
    if (fu.x < 0) {
        fu.x = 0;
    }
    if (fu.y < 0) {
        fu.y = 0;
    }
    if (fu.x > gD.maxWidth) {
        fu.x = gD.maxWidth;
    }
    if (fu.y > gD.maxHeight) {
        fu.y = gD.maxHeight;
    }
    if (bG[0] != undefined) {
        var mR = Math.abs(fu.x - bG[0][bG[0].length - 2]);
        var nf = Math.abs(fu.y - bG[0][bG[0].length - 1]);
        if (mR > 0 || nf > 0) {
            bG[0].push(fu.x);
            bG[0].push(fu.y);
        }
    }
}
;function aD(bY) {
    bY = parseInt(bY * (480 / gD.maxWidth));
    bY = bY.toString(36).toUpperCase();
    bY = bA(bY, 2);
    return bY;
}
;function ba(dU) {
    var ga = new Array();
    for (var i = 0; i < dU.length; i = i + 1) {
        ga.push(aD(dU[i]))
    }
    return ga;
}
;function bA(aJ, hh) {
    while (aJ.toString().length < hh) {
        aJ = '0' + aJ;
    }
    return aJ;
}
;var gQ;
var gD;
var hw;
var fY;
function aK() {
    var bn = new oM.MovieClip().set({
        visible: false
    });
    dG(bn);
    bn.setBounds(0, 0, 1750, ea.maxHeight);
    O(bn);
    bn.show = function() {
        ay(fE);
        eE.oX();
        ab.setChildIndex(this, ab.children.length - 1);
        this.visible = true;
    }
    ;
    bn.hide = function() {
        aI();
        eE.oA();
        this.visible = false;
    }
    ;
    return bn;
}
;function dG(fU) {
    if (ab != undefined) {
        if (gQ == undefined) {
            gQ = cp();
            fU.addChild(gQ);
        }
        if (hD == undefined) {
            hD = ae();
            fU.addChild(hD);
        }
        if (fY == undefined) {
            fY = bL('game');
            fY.set({
                x: 1150
            });
            fU.addChild(fY);
        }
    }
}
;function cp() {
    var bn = new oM.MovieClip().set({
        x: 270
    });
    bn.qY = new oM.Shape().set({
        x: 12,
        y: 8,
        alpha: .2
    });
    bn.qY.graphics.beginFill("#000").drawRoundRect(0, 0, 860, ea.maxHeight, 35);
    bn.qY.cache(0, 0, 860, ea.maxHeight);
    bn.qu = qQ();
    bn.qz = pI();
    bn.jh = new oM.Shape().set({
        y: 120
    });
    bn.jh.graphics.setStrokeStyle(8).beginStroke("#993").drawRoundRectComplex(0, 0, 860, ea.maxHeight - 120, 0, 0, 35, 35);
    bn.jh.cache(-10, -10, 880, ea.maxHeight - 100);
    bn.addChild(bn.qY, bn.qu, bn.qz, bn.jh);
    return bn;
}
;function qQ() {
    var bn = new oM.MovieClip();
    if (gZ == undefined) {
        gZ = bu();
        bn.addChild(gZ);
    }
    if (hs == undefined) {
        hs = bX();
        bn.addChild(hs);
    }
    return bn;
}
;function pI() {
    var bn = new oM.MovieClip();
    bn.hq = new oM.Shape();
    bn.hq.graphics.beginFill("#0F0").drawRoundRectComplex(0, 120, 860, ea.maxHeight - 120, 0, 0, 35, 35);
    bn.mask = bn.hq;
    if (gD == undefined) {
        gD = as();
        bn.addChild(gD);
        et = cL();
        gD.addChild(et);
        gH = cu();
        bn.addChild(gH);
    }
    if (hw == undefined) {
        hw = new oM.MovieClip().set({
            y: gD.y,
            scale: 860 / 900
        });
        bn.addChild(hw);
        gx = cY();
        hw.addChild(gx);
        fm = cA();
        hw.addChild(fm);
        fg = gU();
        hw.addChild(fg);
        hE = hB();
        hw.addChild(hE);
        hH = dh();
        hw.addChild(hH);
        fr = cT();
        hw.addChild(fr);
        io = dA();
        hw.addChild(io);
    }
    if (gd == undefined) {
        gd = oU();
        bn.addChild(gd);
    }
    if (hc == undefined) {
        hc = cA().set({
            x: 430,
            y: gD.y + 430
        });
        bn.addChild(hc);
    }
    return bn;
}
;var gV;
var hJ;
function ad() {
    var bn = new oM.MovieClip().set({
        visible: false
    });
    eC(bn);
    bn.setBounds(0, 0, 1620, ea.maxHeight);
    O(bn);
    bn.show = function() {
        gV.empty();
        gV.sJ();
        var aW = T(dj.mu);
        h(aW);
        eE.oX();
        gO = hJ;
        gO.empty();
        ab.setChildIndex(this, ab.children.length - 1);
        this.visible = true;
    }
    ;
    bn.hide = function() {
        gV.sK();
        eE.oA();
        if (gO == hJ) {
            gO = undefined;
        }
        this.visible = false;
    }
    ;
    return bn;
}
;function eC(fU) {
    if (ab != undefined) {
        if (gV == undefined) {
            gV = cE();
            fU.addChild(gV);
        }
        if (hJ == undefined) {
            hJ = bL('lobby');
            hJ.set({
                x: 1020
            });
            fU.addChild(hJ);
        }
    }
}
;var eG;
var fo;
var iR;
var nM;
function av() {
    var bn = new oM.MovieClip().set({
        visible: false
    });
    bn.setScale = function() {
        bn.scale = fF() ? 1.1 : .8;
    }
    ;
    window.addEventListener('resize', bn.setScale, false);
    bn.setScale();
    bn.setBounds(0, 0, 700, 880);
    O(bn);
    var iJ = new oM.Bitmap(kb['papermenu']);
    eG = pD();
    fo = qA();
    iR = rh();
    nM = qe();
    eG.visible = true;
    bn.addChild(iJ, eG, fo, iR, nM);
    iJ.cache(0, 0, 700, 880);
    bn.show = function(nt) {
        fE = 0;
        be(nt);
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
;function rn() {
    eG.hide();
    fo.hide();
    iR.hide();
    nM.hide();
}
;function be(nt) {
    rn();
    eS.hide();
    if (nt == 4) {
        nM.show();
    } else if (nt == 3) {
        iR.show();
    } else if (nt == 2) {
        fo.show();
    } else {
        eG.show();
    }
}
;function sZ() {
    var bn = new oM.MovieClip();
    bn.alpha = .8;
    var rZ = new oM.Shape();
    rZ.graphics.setStrokeStyle(4).beginFill("#999").drawRoundRect(2, 2, 60, 60, 12);
    var sM = new oM.Bitmap(kb['icoback']);
    bn.addChild(rZ, sM);
    bn.cursor = "pointer";
    bn.on("mouseover", function(e) {
        bn.alpha = 1;
    });
    bn.on("mouseout", function(e) {
        bn.alpha = .8;
    });
    return bn;
}
;function pD() {
    var bn = new oM.MovieClip().set({
        x: 75,
        y: 100,
        visible: false
    });
    var jq = (550 / 2) - (440 / 2);
    bn.ff = j(L.dJ('TMPU')).set({
        x: jq,
        y: 140
    });
    bn.hb = j(L.dJ('TMPR')).set({
        x: jq,
        y: 300
    });
    bn.ic = j(L.dJ('TMPL')).set({
        x: jq,
        y: 460
    });
    bn.addChild(bn.ff, bn.hb, bn.ic);
    bn.sJ = function() {
        bn.ff.addEventListener("click", by);
        bn.hb.addEventListener("click", sm);
        bn.ic.addEventListener("click", af);
    }
    ;
    bn.sK = function() {
        bn.ff.removeEventListener("click", by);
        bn.hb.removeEventListener("click", sm);
        bn.ic.removeEventListener("click", af);
    }
    ;
    bn.show = function() {
        this.sJ();
        this.visible = true;
    }
    ;
    bn.hide = function() {
        this.sK();
        this.visible = false;
    }
    ;
    return bn;
}
;function qA() {
    var bn = new oM.MovieClip().set({
        x: 75,
        y: 60,
        visible: false
    });
    bn.fT = sZ().set({
        x: -40,
        y: -40,
        scale: 1.5
    });
    bn.fT.on("click", function() {
        bn.sz();
    });
    bn.addChild(bn.fT);
    var jq = (550 / 2) - (440 / 2);
    bn.ff = j(L.dJ('TMUM')).set({
        x: jq,
        y: 260
    });
    bn.hb = j(L.dJ('TMCM')).set({
        x: jq,
        y: 420
    });
    bn.ff.on("click", function() {
        cN.play(16);
        be(3)
    });
    bn.hb.on("click", function() {
        cN.play(16);
        be(4)
    });
    bn.addChild(bn.ff, bn.hb);
    bn.show = function() {
        this.visible = true;
    }
    ;
    bn.hide = function() {
        this.visible = false;
    }
    ;
    bn.sz = function() {
        cN.play(16);
        rI();
    }
    ;
    return bn;
}
;function rh() {
    var bn = new oM.MovieClip().set({
        x: 75,
        y: 60,
        visible: false
    });
    bn.fT = sZ().set({
        x: -40,
        y: -40,
        scale: 1.5
    });
    bn.fT.on("click", function() {
        cN.play(16);
        be(2)
    });
    bn.addChild(bn.fT);
    var jq = (550 / 2) - (440 / 2);
    bn.ff = j("OK").set({
        x: jq,
        y: 590
    });
    bn.ff.on("click", function(bQ) {
        bn.ce(bQ);
    });
    bn.addChild(bn.ff);
    bn.kn = new oM.MovieClip();
    bn.addChild(bn.kn);
    bn.pH = function() {
        var gT = new oM.MovieClip();
        var gb = new oM.Shape();
        gb.graphics.setStrokeStyle(1).beginStroke("#999").beginFill("#c7c7c7").drawRoundRect(0, 0, 340, 54, 5);
        gT.addChild(gb);
        return gT;
    }
    ;
    bn.qM = function(dH, hX, jp) {
        bn.jC = sH(dH).set({
            x: hX,
            y: jp,
            scale: 1.3
        });
        bn.jC.setBounds(new oM.Rectangle(-2,-2,344,58));
        bn.jC.mw(bn.pH());
        return bn.jC;
    }
    ;
    bn.nK = bn.qM('tablenum', 54, 290);
    bn.nA = bn.qM('code1', 54, 470);
    bn.nA.on("enterKey", function(bQ) {
        bn.ce(bQ);
    });
    bn.addChild(bn.nK, bn.nA);
    bn.qS = function() {
        bn.kn.removeAllChildren();
        var kP = dI(L.dJ('TIECSU'), 54, 0, 80);
        var lw = dI(L.dJ('TMN'), 48, 50, 230);
        var jG = dI(L.dJ('TCOD'), 48, 50, 410);
        bn.kn.addChild(kP, lw, jG);
        bn.kn.cache(0, 0, 580, 600);
    }
    ;
    bn.ce = function(bQ) {
        if (bn.visible == true) {
            if (bQ.type == 'click') {
                cN.play(16);
            }
            var jE = bn.nK.rm();
            var gu = bn.nA.rm();
            if (jE != '' && gu != '') {
                bn.hide();
                pU(jE, gu);
            }
        }
    }
    ;
    bn.show = function() {
        this.qS();
        bn.nK.empty();
        bn.nA.empty();
        this.visible = true;
    }
    ;
    bn.hide = function() {
        this.visible = false;
    }
    ;
    return bn;
}
;function qe() {
    var bn = new oM.MovieClip().set({
        x: 75,
        y: 60,
        visible: false
    });
    bn.fT = sZ().set({
        x: -40,
        y: -40,
        scale: 1.5
    });
    bn.fT.on("click", function() {
        cN.play(16);
        be(2)
    });
    bn.addChild(bn.fT);
    var jq = (550 / 2) - (440 / 2);
    bn.hb = j("OK").set({
        x: jq,
        y: 410
    });
    bn.hb.on("click", function(bQ) {
        bn.ce(bQ);
    });
    bn.addChild(bn.hb);
    bn.kn = new oM.MovieClip();
    bn.addChild(bn.kn);
    bn.pH = function() {
        var gT = new oM.MovieClip();
        var gb = new oM.Shape();
        gb.graphics.setStrokeStyle(1).beginStroke("#999").beginFill("#c7c7c7").drawRoundRect(0, 0, 340, 54, 5);
        gT.addChild(gb);
        return gT;
    }
    ;
    bn.qM = function(dH, hX, jp) {
        bn.jC = sH(dH).set({
            x: hX,
            y: jp,
            scale: 1.3
        });
        bn.jC.setBounds(new oM.Rectangle(-2,-2,344,58));
        bn.jC.mw(bn.pH());
        return bn.jC;
    }
    ;
    bn.nN = bn.qM('code2', 54, 290);
    bn.nN.on("enterKey", function(bQ) {
        bn.ce(bQ);
    });
    bn.addChild(bn.nN);
    bn.qS = function() {
        bn.kn.removeAllChildren();
        var ky = dI(L.dJ('TCUSPJTA'), 54, 0, 80);
        var kN = dI(L.dJ('TCOD'), 48, 50, 230);
        bn.kn.addChild(ky, kN);
        bn.kn.cache(0, 0, 580, 600);
    }
    ;
    bn.ce = function(bQ) {
        if (bn.visible == true) {
            if (bQ.type == 'click') {
                cN.play(16);
            }
            var gu = bn.nN.rm();
            if (gu != '') {
                bn.hide();
                var aW = T(dj.oZ, gu);
                h(aW);
            }
        }
    }
    ;
    bn.show = function() {
        this.qS();
        bn.nN.empty();
        this.visible = true;
    }
    ;
    bn.hide = function() {
        this.visible = false;
    }
    ;
    return bn;
}
;function by() {
    cN.play(16);
    dW.oc();
    eS.show();
}
;function sm() {
    cN.play(16);
    rn();
    eS.show();
}
;function af() {
    cN.play(16);
    dW.oc();
    eS.show();
}
;function dI(aJ, kZ, hX, jp) {
    var dX = new oM.Text(aJ,"bold " + kZ + "px Helvetica","#333").set({
        lineWidth: 580,
        x: hX,
        y: jp
    });
    return dX;
}
