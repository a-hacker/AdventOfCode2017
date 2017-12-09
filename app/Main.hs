module Main where

import Tower
import Data.List.Split
import qualified Data.Map as Map

main :: IO ()
main =
    let
        input = "ifyzcgi (14)\n\
                 \axjvvur (50)\n\
                 \tcmdaji (40) -> wjbdxln, amtqhf\n\
                 \yjzqr (73)\n\
                 \smascq (97)\n\
                 \hyehtm (7)\n\
                 \oylvq (136) -> witry, cvlod\n\
                 \csyiik (34)\n\
                 \zivjpfo (23) -> lcchgb, bhqlq\n\
                 \ggfmiv (94)\n\
                 \vpltn (41)\n\
                 \gzxnn (171) -> mqodhde, djvkd\n\
                 \bsfygp (75)\n\
                 \dnrjb (9)\n\
                 \ohdnhx (261) -> tgiou, lndczw\n\
                 \frcrd (56)\n\
                 \cldaag (31) -> orbcuzi, teyakvf\n\
                 \vphlxz (26)\n\
                 \nljmcv (47)\n\
                 \xcxqa (6759) -> znely, rtsbgwx, hilafgl\n\
                 \hywzja (81)\n\
                 \ytxcti (60)\n\
                 \igzvp (68)\n\
                 \uzvsml (34)\n\
                 \keusrg (27)\n\
                 \tlmfw (45) -> pehflc, lefxyzt\n\
                 \hjmtrw (6772) -> cblhmk, zzflc, xsztla, iitbuxz, tckyc\n\
                 \ahjlf (1474) -> ejvipa, xhzyzer, pzwtjfj\n\
                 \egszxz (14)\n\
                 \skmuo (1607) -> rxsihsa, vsslzfp\n\
                 \ifyja (32) -> rvixnmq, aumrixf, wbenaek, jkkwtd, ywnsmem, mmhtyd, xmzzrgs\n\
                 \dwnokzu (311) -> xinfpy, lwvfsu\n\
                 \txbgfm (33)\n\
                 \roqfxg (62) -> wrhnq, rskara\n\
                 \autjn (29)\n\
                 \hnedp (10)\n\
                 \owxawf (60) -> twoyl, sikmtaj, lvptmrf\n\
                 \jensj (281)\n\
                 \sglkjsh (66)\n\
                 \eeziziu (34)\n\
                 \qjuuu (83)\n\
                 \iebulx (297) -> mqcflzv, nafrmeo\n\
                 \lhfuku (159) -> syzcti, ynhvfvx, ckegba\n\
                 \mxnlv (61)\n\
                 \emtjcx (60)\n\
                 \jspui (58) -> chlpx, xjkquk, afyxhh\n\
                 \nmikggy (64)\n\
                 \vatflrk (6) -> uxbhu, gekygl, xdyrvy, wesoooi, esphpt\n\
                 \jfcoc (41)\n\
                 \gyepcnc (6)\n\
                 \atbiby (80) -> aqtog, qjsvs\n\
                 \ygnkwn (52)\n\
                 \piexct (65)\n\
                 \uitfx (39)\n\
                 \rdvciwk (55)\n\
                 \jkgnvbn (23)\n\
                 \xpewzk (45)\n\
                 \vlqyxe (337) -> rosfnb, vphlxz\n\
                 \bmdgthp (215) -> kyfuyaf, tzrqqk\n\
                 \czafdho (24)\n\
                 \emuwzd (102) -> ifyzcgi, edotax\n\
                 \fwabsk (14)\n\
                 \uftnfv (53)\n\
                 \ndkcn (39) -> mkjuq, ghcgz, cxpwfir, lxwvf, nsghrq, vyvrn\n\
                 \srzfd (77)\n\
                 \gqhnstx (870) -> xmedt, brzucfh, layqazp\n\
                 \bdnjn (57)\n\
                 \pbckxv (14)\n\
                 \fbpbs (74)\n\
                 \zwutlym (92)\n\
                 \lzeud (290) -> igkrktn, oixlcn\n\
                 \gjctf (27)\n\
                 \azmneyd (60)\n\
                 \wbenaek (253) -> gdunxee, vgiqvsi, bmlkhaf\n\
                 \orpjw (72)\n\
                 \dgyulo (9)\n\
                 \qklqozd (125) -> otikjx, wuvhyc, dwejsn\n\
                 \waiwj (47)\n\
                 \bnevesk (256) -> dmglcj, blnwcb\n\
                 \yqnjd (50)\n\
                 \vvkkkpb (39)\n\
                 \ciprksz (84)\n\
                 \hblux (91)\n\
                 \dfywz (60)\n\
                 \jeiqx (26)\n\
                 \zdissfg (7)\n\
                 \mriqcjy (66)\n\
                 \eydak (49)\n\
                 \qwxwd (49)\n\
                 \plhlj (64)\n\
                 \nqgbp (67)\n\
                 \ewwfzg (70)\n\
                 \djzjiwd (44600) -> zszzkl, hrnrjrt, hjmtrw\n\
                 \mtflvu (71)\n\
                 \shesfq (143) -> ohdnhx, uhnqr, zdglrh, ripilxo, gfszte\n\
                 \huzokb (298) -> mnqii, mieqti\n\
                 \ohuvsf (83)\n\
                 \wcdibhx (196) -> xvwvc, ncmad, jkgnvbn\n\
                 \fxlbc (184) -> mdqeh, kmvcmg, sonvcww, pcckqq\n\
                 \lnknp (91)\n\
                 \swugafb (504) -> ryazls, vmkeu, fewrzd\n\
                 \pmadd (97)\n\
                 \mprgtb (42)\n\
                 \lorxjw (62)\n\
                 \welidg (97)\n\
                 \zzbad (30) -> npccgnv, yqnjd\n\
                 \dwejsn (40)\n\
                 \fvivo (225) -> worqh, yjzqr\n\
                 \zuawuo (111) -> jktlfu, uhvtpfy, ivlus\n\
                 \ikaol (26)\n\
                 \mmhtyd (220) -> yekmflj, nmikggy, xepgx\n\
                 \hujjten (37)\n\
                 \htqps (36)\n\
                 \dlobfkw (44)\n\
                 \fxrijc (57)\n\
                 \xgfad (33) -> zivlnu, ipsst\n\
                 \pafiy (17) -> dhtxpbb, dgcecu\n\
                 \cblhmk (1108) -> ggmhxx, tysdkgl, rrvbwb\n\
                 \kioga (93)\n\
                 \ljhlxc (83)\n\
                 \qsvbb (56)\n\
                 \uaffk (61)\n\
                 \lvptmrf (58)\n\
                 \hebhue (11)\n\
                 \eefyyr (10)\n\
                 \wyylpt (184) -> oneoorw, cfbaj\n\
                 \vmboh (90)\n\
                 \ghcgz (195) -> tajfmq, yzufk\n\
                 \jjhrmi (190) -> qhubjd, uycop\n\
                 \teduvv (25)\n\
                 \xjadrfg (28)\n\
                 \ugcccv (67) -> wehdeq, gyepcnc\n\
                 \psdzpg (38)\n\
                 \hyhbu (593) -> sblfh, ekvdv, iicpkf, xidtz\n\
                 \satjdgz (60)\n\
                 \cjbdxts (34)\n\
                 \gdunxee (53)\n\
                 \fqswta (47)\n\
                 \iwouvid (81)\n\
                 \iqbdxb (67)\n\
                 \ozbjpiq (16)\n\
                 \ysafyj (97)\n\
                 \lcchgb (82)\n\
                 \wkamonm (19)\n\
                 \waqca (61)\n\
                 \bbeyl (9)\n\
                 \rkfspx (17)\n\
                 \nggtuh (64)\n\
                 \jmypc (20)\n\
                 \yfegso (122) -> yhsmjfq, jzmacb, autjn, werkz\n\
                 \zirysk (72)\n\
                 \rtsbgwx (251) -> cbmqx, hvmlb, rsstvn, jtyurkp, gmkvgf, qkawtfu, ggwtf\n\
                 \yxgwsj (14)\n\
                 \xmgqmv (84)\n\
                 \lncmhi (48)\n\
                 \orclyi (30)\n\
                 \bjwny (94)\n\
                 \zehkwy (69)\n\
                 \mzajj (92) -> nljmcv, waiwj\n\
                 \ffsehyc (17)\n\
                 \agelbfq (343) -> iuchai, qynrx\n\
                 \dgcecu (86)\n\
                 \wtqxei (61) -> afywb, dqbfloz\n\
                 \vlmihf (32)\n\
                 \lovox (77)\n\
                 \cmvofka (30)\n\
                 \ttbuzrh (96)\n\
                 \vsunxw (196) -> pdbykx, dnynny, pqjua, jhnujj\n\
                 \skfnp (97)\n\
                 \upuybrd (300) -> dnrjb, rfknc, bbeyl\n\
                 \cpmebw (60)\n\
                 \wkmtw (59)\n\
                 \rpvwtq (5)\n\
                 \jenfafh (58)\n\
                 \pubtxq (51)\n\
                 \xlkwyg (55)\n\
                 \iltoh (22)\n\
                 \ctaazgn (103) -> hywzja, pywmbis\n\
                 \zxhqlfy (26)\n\
                 \dklujy (76)\n\
                 \khgvmj (66)\n\
                 \yfnkp (33)\n\
                 \edsjbi (37)\n\
                 \brtomr (75)\n\
                 \siqcu (15)\n\
                 \kxdehcg (13)\n\
                 \vmkeu (315)\n\
                 \momda (90)\n\
                 \pocvrcs (6)\n\
                 \sonvcww (17)\n\
                 \nemrt (91)\n\
                 \ldbkyg (75)\n\
                 \jsrrt (22)\n\
                 \ifuvyo (180) -> zvszwl, utewfcr, dtmbf\n\
                 \kfzqw (80)\n\
                 \iyfyi (41)\n\
                 \tykwy (44)\n\
                 \twgjdmg (24)\n\
                 \qface (27)\n\
                 \ygkdmh (74)\n\
                 \sblfh (120) -> gglxj, fqswta\n\
                 \gbldz (49) -> xitcp, jpynea\n\
                 \hmjpa (122) -> elovaun, uijgiu, apxgf, nlacdac\n\
                 \wsixz (14)\n\
                 \vgegr (83)\n\
                 \fggyk (46)\n\
                 \kjoru (16)\n\
                 \ixqrl (22)\n\
                 \gklehu (84) -> sazbmjz, piexct\n\
                 \xxego (33)\n\
                 \jxfimbl (95) -> nvpdisw, kioga\n\
                 \vymmkdf (116) -> ofqbu, sboms, obbpd, czafdho\n\
                 \jpwtbds (1608) -> zwutlym, qntzr\n\
                 \xsztla (828) -> cmdizw, qxkhq, nfcbi, rtutzu\n\
                 \wtfliw (87)\n\
                 \lbxrh (94)\n\
                 \ybioco (29)\n\
                 \yvdhwyh (102) -> xpewzk, hdxrbzc, vsaejz, pudso\n\
                 \eauxeyl (53)\n\
                 \skuazsw (70)\n\
                 \jlcie (99)\n\
                 \ckmftuc (21) -> khixdho, ihzsljz, uvkxner\n\
                 \yuikqm (68)\n\
                 \dqbfloz (87)\n\
                 \zofjia (133) -> gshsx, ntkpthi\n\
                 \vyvrn (173) -> lrjbgd, vwojto\n\
                 \tszockk (729) -> ctaazgn, gqbwc, wcdibhx, cujimpt\n\
                 \ydqqgrw (15)\n\
                 \hcxwql (398) -> lpoejf, cmvofka\n\
                 \gjedup (5)\n\
                 \arelp (195)\n\
                 \aonfn (235) -> kzkfcn, eefyyr\n\
                 \lsgbe (99)\n\
                 \gunvu (99)\n\
                 \kasaf (34)\n\
                 \imohij (13)\n\
                 \khwbzl (1131) -> zlbnkdc, ljmrml, roqfxg\n\
                 \nwikfyc (80)\n\
                 \khtegw (91)\n\
                 \epggt (90)\n\
                 \yapaib (175) -> gunvu, ymdmn\n\
                 \saawhdk (12641) -> vwvowk, ilcsp, vatflrk, iajts\n\
                 \qoetrb (15)\n\
                 \ztmmr (147) -> ypkhqlq, uitfx\n\
                 \uqfbnlo (69)\n\
                 \sgrhs (249) -> zymggc, wnvrg\n\
                 \hqjinj (101) -> skuazsw, ewwfzg\n\
                 \vmpnccn (73) -> bidhw, qriyeb, xsyzhcf, ehjjbu\n\
                 \vqddcl (71)\n\
                 \yffeit (76)\n\
                 \xvzinl (99)\n\
                 \znzbkh (16) -> swnan, tbioyr\n\
                 \gnjit (23) -> dhfagjw, xxnpoe\n\
                 \qojhhod (1789) -> sjdanf, hmjpa, szglq\n\
                 \aluqao (313) -> lyhlx, ouhuptm\n\
                 \ipysrdj (222)\n\
                 \worqh (73)\n\
                 \tsxfibs (46) -> yfnkp, edjlm, txbgfm\n\
                 \pcumn (420) -> qwcyozf, dskuj, anoxh, dkmkdfd, fkapr\n\
                 \mejwrm (139) -> oxsewk, zsknxq\n\
                 \aynpyne (44)\n\
                 \sikmtaj (58)\n\
                 \sbfprua (70)\n\
                 \wwofru (53)\n\
                 \nmuxe (88)\n\
                 \uuvtlk (74)\n\
                 \rqisvrh (2703) -> bvmgt, gbxxpd, ffinat, ympbbx, uimoc, shesfq\n\
                 \ehjjbu (89)\n\
                 \cbmqx (163) -> bnlbs, psdzpg\n\
                 \naekrk (70)\n\
                 \cvnrr (17)\n\
                 \pwnqyt (133) -> zijzutq, yvdhwyh, vbmyyrh\n\
                 \sagyrje (49)\n\
                 \efuysje (97)\n\
                 \pzwtjfj (74) -> oyienb, ozbjpiq\n\
                 \ggmhxx (42) -> fhhgts, cepxc, zwzxy\n\
                 \bhfui (13)\n\
                 \chlpx (87)\n\
                 \hmlbrz (55)\n\
                 \oneoorw (90)\n\
                 \kyfuyaf (79)\n\
                 \kiylza (88)\n\
                 \fghxbc (99) -> fozagvz, wqgssb, kqqsq, oijwjli\n\
                 \qgxgzo (14)\n\
                 \cubqfzc (184) -> qwmqci, dmvcduz\n\
                 \lcqfe (61)\n\
                 \xypffi (11)\n\
                 \qntzr (92)\n\
                 \mkjuq (181) -> jdiczst, edsjbi\n\
                 \dhtii (62) -> kfzqw, lbozpy\n\
                 \amtqhf (99)\n\
                 \ixknk (37)\n\
                 \iuapj (162) -> gzfrn, wqtuhe, fndyvvn, zjveu, iebulx, agelbfq\n\
                 \khtooum (53)\n\
                 \aecsfp (72)\n\
                 \fcdcdh (88)\n\
                 \junfev (18)\n\
                 \pxfrz (91)\n\
                 \xratfed (6)\n\
                 \gwbfat (26)\n\
                 \cvcblhv (73) -> jbnns, glkjrrs\n\
                 \sdfvrod (114) -> lcqfe, uigcn\n\
                 \xkfkucf (951) -> skbrota, pwvahdb, odpqjr\n\
                 \okkvefs (820) -> fpuscxk, zhdioii, gzxnn, koxnez\n\
                 \dgosy (59)\n\
                 \yhvndwy (27)\n\
                 \pefzsea (86)\n\
                 \xaogy (131) -> ixknk, ykvss, hujjten\n\
                 \nvpdisw (93)\n\
                 \lmkwafp (56)\n\
                 \cwnvk (51) -> tvdsktm, pwzsq, plhlj, ayqbj\n\
                 \phbtrm (171) -> hmmjjct, xzvln\n\
                 \mrmbyj (53)\n\
                 \jibemf (87)\n\
                 \tysdkgl (20) -> mrwbv, llkaoeh\n\
                 \fpuscxk (147) -> ypdumo, lvdrrk\n\
                 \ejkumeu (235) -> xypffi, nvcafwu, cvdows\n\
                 \uijgiu (38)\n\
                 \cjjynt (264) -> rkwhbhr, axjvvur\n\
                 \nobfn (236)\n\
                 \svanha (62)\n\
                 \nuxxmd (53) -> lybaepp, eolqn\n\
                 \vsaejz (45)\n\
                 \hbbpuc (238) -> thrvlt, ziiqv\n\
                 \tbley (31) -> nvfca, nojly, nguafeb\n\
                 \bkkwe (70)\n\
                 \tywzxwb (24) -> lbhlxqa, dklujy, vzxktth\n\
                 \ezqeusd (71)\n\
                 \qwcyozf (115) -> igzvp, vtefqb\n\
                 \xpwxo (80)\n\
                 \layqazp (39)\n\
                 \hwdtvvc (40)\n\
                 \pwnxw (69)\n\
                 \jobwpao (181) -> pqgiox, uloppmh\n\
                 \wrhnq (87)\n\
                 \amsfvm (53) -> nqgbp, bcldmsg\n\
                 \dfxjjzr (190) -> udaitd, sdktm\n\
                 \cnwzxpy (65)\n\
                 \kpvbt (85)\n\
                 \ifbhg (62)\n\
                 \cpeonw (27)\n\
                 \rsizei (20)\n\
                 \gmkvgf (63) -> tykwy, dlobfkw, aynpyne, vaovit\n\
                 \bjiuus (56)\n\
                 \bwpeux (17)\n\
                 \szrkuzi (27)\n\
                 \ygvpk (33701) -> saawhdk, svthizp, abamn\n\
                 \mjtji (35)\n\
                 \rqvvv (50) -> pzbxpou, rxzfdg\n\
                 \pozua (128) -> vljjqbw, hmlbrz\n\
                 \hmjueiq (79)\n\
                 \hdxrbzc (45)\n\
                 \twway (181) -> orclyi, hmdxion\n\
                 \jocmdmv (72)\n\
                 \lacddy (68)\n\
                 \lsxjl (94)\n\
                 \edotax (14)\n\
                 \gmirjhi (62)\n\
                 \iwicpur (10)\n\
                 \uigcn (61)\n\
                 \ynhvfvx (32)\n\
                 \ugavy (91)\n\
                 \jbgxcj (48)\n\
                 \zdglrh (239) -> csrww, haqaohl, gskveo, qoetrb\n\
                 \lmlsog (62)\n\
                 \sazbmjz (65)\n\
                 \ymeoz (24) -> lbxrh, lsxjl\n\
                 \hhqmsd (34)\n\
                 \ykmfoah (245)\n\
                 \lfdefc (30)\n\
                 \qynrx (53)\n\
                 \znely (919) -> qcmnpm, yjutt, yqgesx\n\
                 \cauig (58)\n\
                 \gvamhux (71)\n\
                 \hqqingt (13)\n\
                 \fiynt (72)\n\
                 \tyysd (63) -> cjjynt, lzeud, wyylpt, pewxc, ibevwow, fvmeeas, uksnrfx\n\
                 \igkrktn (37)\n\
                 \pzbxpou (87)\n\
                 \dllzp (59)\n\
                 \iblvki (11)\n\
                 \vaovit (44)\n\
                 \tcpduh (212)\n\
                 \btpvxq (56) -> urktg, ifnkl, hbbpuc, casmwo, ylqvuk, dblmcye, zvpboy\n\
                 \xxnpoe (67)\n\
                 \sboms (24)\n\
                 \whvvemg (83) -> tafss, vnfigul\n\
                 \ljjyy (64)\n\
                 \qvdid (70)\n\
                 \koxnez (71) -> bolpsk, pefzsea\n\
                 \elgtk (40)\n\
                 \wesoooi (87) -> pmadd, welidg\n\
                 \tiikt (92)\n\
                 \eadvs (797) -> ofnewz, neywe, qklqozd, ykmfoah\n\
                 \sreke (34)\n\
                 \clqqyi (51)\n\
                 \kuufl (1074) -> aonfn, cgrima, lhfuku\n\
                 \qswoy (7) -> bklfmch, xpwxo, eoustfr\n\
                 \rakfg (91) -> fiynt, opdtk, qkhvu\n\
                 \zvgsa (59)\n\
                 \gskveo (15)\n\
                 \clbbi (27)\n\
                 \ilcsp (844) -> pafiy, phbtrm, nwupf\n\
                 \blnwcb (17)\n\
                 \udaitd (23)\n\
                 \aewmad (73)\n\
                 \tvdsktm (64)\n\
                 \zavcu (25)\n\
                 \gglxj (47)\n\
                 \jmrlaxf (48)\n\
                 \sppxnti (48)\n\
                 \zhdioii (243)\n\
                 \olepfo (98)\n\
                 \ezsnmw (14)\n\
                 \hsmjm (25)\n\
                 \xmuxsr (44) -> bjiuus, qqjly\n\
                 \kmvcmg (17)\n\
                 \zuoeh (7782) -> hbaxtai, pmefov, zfteizz\n\
                 \sqxrad (80) -> marord, jbgxcj, xsmyok\n\
                 \vrbcn (34)\n\
                 \ibevwow (308) -> cvnabd, pbckxv, xrunic, ezsnmw\n\
                 \rqilp (25) -> quwfos, vekxdqh\n\
                 \ojfzokk (99)\n\
                 \bjwvw (209)\n\
                 \sygjhzp (36) -> hsxhyf, knqxdq\n\
                 \pjvnmqn (43) -> azoutv, jwhcmc\n\
                 \qqjly (56)\n\
                 \iezyfwf (20)\n\
                 \wrlkfij (55)\n\
                 \wuvhyc (40)\n\
                 \aqgtml (51) -> wywxu, tiikt, uwnwp\n\
                 \fhjysp (164) -> czvyrzi, nbmnwsq\n\
                 \rmlru (71)\n\
                 \bdiiv (15)\n\
                 \tlxekcp (42)\n\
                 \lbozpy (80)\n\
                 \uksnrfx (224) -> bkkwe, sbfprua\n\
                 \gmuwpyi (90)\n\
                 \zsqzm (64)\n\
                 \evhhfo (5)\n\
                 \xdyrvy (189) -> wyois, cwkdlil\n\
                 \gbxxpd (82) -> rynmge, hngao, vlqyxe, jhyjqxq\n\
                 \nzhqepw (60)\n\
                 \zfteizz (59) -> ytvjxq, vhoasjq, fwwub, xglsp, cubqfzc, nfucnzx\n\
                 \ulragq (39)\n\
                 \jgrsa (269) -> ukfsn, kptjhtd\n\
                 \uisnk (2228) -> tbley, eqkot, tlmfw, gnjit\n\
                 \chyhykz (59)\n\
                 \zjveu (437) -> qhyfphs, bfwnv\n\
                 \syliku (78)\n\
                 \syzcti (32)\n\
                 \nnmayb (85)\n\
                 \zdqmuey (209) -> ibkfqok, lhmgw\n\
                 \myopc (16)\n\
                 \cifdyio (74)\n\
                 \nguafeb (42)\n\
                 \dbczwnr (15)\n\
                 \vxede (10)\n\
                 \ouhuptm (52)\n\
                 \sdyox (93)\n\
                 \slahk (43)\n\
                 \skbrota (217) -> toeyz, gjcibb\n\
                 \hbaxtai (851) -> zynpp, ylbaxtu, rfwaq\n\
                 \hvdfq (112) -> imohij, pwetqid\n\
                 \zgfqdv (15)\n\
                 \dpqxfp (209)\n\
                 \arskvgv (88)\n\
                 \bqywl (157) -> ooufod, clqqyi\n\
                 \ymataqq (22)\n\
                 \krwgy (109) -> dllzp, xqpfvwx\n\
                 \ohsyhln (53)\n\
                 \ofqbu (24)\n\
                 \ccpnopa (59)\n\
                 \bfkbp (156)\n\
                 \bolpsk (86)\n\
                 \tckyc (456) -> dzfclsm, sqxrad, qkrpzl, ppcsoo, rqvvv\n\
                 \qbftkij (204) -> rtcfcyn, vlmihf\n\
                 \bpcnzi (82)\n\
                 \rhacrz (27)\n\
                 \wzbqh (306) -> xratfed, fjcobs, enlctw, pklcmix\n\
                 \qqnmzb (1723) -> mzyqoc, soirl, dhtii, ahbcl\n\
                 \tuvehcz (17)\n\
                 \yzufk (30)\n\
                 \xsmyok (48)\n\
                 \tgiou (19)\n\
                 \izvtqsa (84)\n\
                 \ooufod (51)\n\
                 \rfwaq (80) -> nmuxe, ttofoep\n\
                 \lpoejf (30)\n\
                 \oykwsk (76)\n\
                 \wdipy (92)\n\
                 \jbnns (93)\n\
                 \qcxiehu (312) -> eeune, gbldz, ztmmr\n\
                 \vsslzfp (91)\n\
                 \uimoc (30) -> crhojk, ejkumeu, lovaf, fhjysp, uxbrs, qbftkij\n\
                 \phtghp (3945) -> rpjozji, swnafht, swugafb, guyrnpn, evbtz, hyhbu\n\
                 \svthizp (1149) -> saddwx, olhnx, uisnk, iuapj, btpvxq, iovxjv\n\
                 \xvwvc (23)\n\
                 \ovpzt (139) -> dfywz, emtjcx\n\
                 \uatlbrq (17)\n\
                 \hmpisyb (41) -> igdtz, lnmhw, ttpmzgm, dkxzsaq\n\
                 \pehflc (56)\n\
                 \iedfk (49) -> ydqqgrw, bdiiv\n\
                 \nomeb (112) -> mmfuve, lxudoaz\n\
                 \ffuqr (90)\n\
                 \gsgwqk (204) -> ddraicf, dgyulo\n\
                 \igqle (222)\n\
                 \jhcwkl (41)\n\
                 \yfusbw (76)\n\
                 \lpsafeq (51)\n\
                 \lklqxg (83)\n\
                 \lofayaa (22)\n\
                 \itqwz (113) -> rhacrz, keusrg\n\
                 \xbidr (74) -> pozua, gisiv, skpux, tcmdaji, gorpw, yfegso, waakcx\n\
                 \pnouux (9)\n\
                 \ryazls (221) -> zhpfgzv, rvpxob\n\
                 \bxwng (53)\n\
                 \xwkyrer (8691) -> srnnjbb, qcxiehu, gqhnstx, ghdbwu\n\
                 \nbmnwsq (52)\n\
                 \cxfsoh (53)\n\
                 \gdylf (74) -> jlcie, hewatw, sdpsl\n\
                 \vksyy (96) -> wfpzhfz, phsmt, zuwaw\n\
                 \qekxzsx (87)\n\
                 \qzglav (42) -> ubxvdq, aqvtgi\n\
                 \xsoqzbe (1068) -> llgbz, itqwz, yxzlpnj\n\
                 \lndczw (19)\n\
                 \perzy (46)\n\
                 \oigsk (38)\n\
                 \uytsra (106) -> hkgxpgh, gzxddd\n\
                 \zszzkl (72) -> ifyja, cdqdm, rwmdbn, exwzzr, leyikdx\n\
                 \wfvjnxf (93)\n\
                 \pklcmix (6)\n\
                 \cvpuwrb (82)\n\
                 \ileugiu (225)\n\
                 \defbun (57)\n\
                 \fbzvm (72) -> vgexqw, cejtpyf\n\
                 \aduikk (133) -> kmfel, paopwt, hdjzg, qckzqv\n\
                 \shlfz (3932) -> swcvn, obwkzhc, pcumn\n\
                 \yhjhgu (57)\n\
                 \vgiqvsi (53)\n\
                 \iajts (451) -> izzzyqd, fegaac, jagdwg, mblvpm\n\
                 \kxwbdvm (1104) -> mzajj, ubuge, ddguar, znzbkh\n\
                 \rynmge (25) -> ecwjaw, zdqsmv, aodoc, pxfrz\n\
                 \bqxnoid (31) -> aqgtml, qprenhy, upuybrd, sgrhs, flptbw, mxwbp, boszym\n\
                 \kqqsq (37)\n\
                 \xrunic (14)\n\
                 \vqnyvr (57)\n\
                 \lvdrrk (48)\n\
                 \bamxvq (86) -> zywvdda, ygnkwn, taxrkif\n\
                 \xkzvo (33)\n\
                 \vhoasjq (226) -> uogva, tuvehcz\n\
                 \hkgxpgh (46)\n\
                 \zocwx (35)\n\
                 \qhyfphs (6)\n\
                 \coselm (44)\n\
                 \ypbrxyq (206) -> siqcu, kqicqf\n\
                 \ffgzg (151)\n\
                 \ujuunj (64)\n\
                 \iuchai (53)\n\
                 \ykvss (37)\n\
                 \ovszp (64)\n\
                 \helyfoo (65)\n\
                 \pryhgj (81)\n\
                 \fxhqq (29)\n\
                 \eeshl (30)\n\
                 \qzftgbx (44)\n\
                 \ppcsoo (26) -> gwqgewp, lsgbe\n\
                 \xinfpy (53)\n\
                 \ddraicf (9)\n\
                 \xidtz (126) -> azuoza, coselm\n\
                 \ipsst (23)\n\
                 \wzvzgg (60)\n\
                 \fqqyipa (200) -> eeshl, cxqeyt, qkhqrq\n\
                 \jpyvpw (20)\n\
                 \xhzyzer (82) -> pawvr, dckbvlg\n\
                 \boszym (129) -> rqrhrnz, beewze, evqibrc\n\
                 \kabqu (38)\n\
                 \sdpsl (99)\n\
                 \bekguie (31)\n\
                 \klovr (30) -> kihqh, wafjqj\n\
                 \zklbfdg (47)\n\
                 \ccter (84)\n\
                 \wzqanwj (240) -> zavcu, hsmjm\n\
                 \uxbrs (94) -> qekxzsx, odqns\n\
                 \dzxpqj (22)\n\
                 \csrww (15)\n\
                 \wwxak (108) -> vbmqj, ugavy\n\
                 \etfbuu (22)\n\
                 \miwst (40)\n\
                 \iiugq (15)\n\
                 \cuprzhk (40)\n\
                 \waakcx (238)\n\
                 \faijmsh (35) -> rwakmo, nwikfyc\n\
                 \cvlod (76)\n\
                 \sjgvkg (1566) -> cldaag, bjwvw, dpqxfp, dgdtt, ujbzq\n\
                 \ixxww (61)\n\
                 \mipqe (91)\n\
                 \xitcp (88)\n\
                 \lxudoaz (51)\n\
                 \ibkfqok (19)\n\
                 \ulchkal (55)\n\
                 \qubli (60)\n\
                 \tsamaj (1171) -> axgndac, vbuvkx, uqeag, qyurm, lzypz\n\
                 \mmpnppi (60)\n\
                 \prlvn (63)\n\
                 \ddwursx (245) -> sdwrx, jtfylv\n\
                 \aljgr (62)\n\
                 \glkjrrs (93)\n\
                 \vwftcva (46)\n\
                 \ylbaxtu (144) -> frcrd, shjxje\n\
                 \jqpdpr (14)\n\
                 \yzhvrx (90) -> viqvtzw, twway, zwzzce, hqjinj, mejwrm, yyursb, gfigt\n\
                 \iqoxkhd (91)\n\
                 \locrtxl (2681) -> xsoqzbe, oxoocfp, ndkcn, vmeubf\n\
                 \fbmajm (58)\n\
                 \rylaxjf (90) -> ojfzokk, iksaub\n\
                 \wyois (46)\n\
                 \ecwjaw (91)\n\
                 \alhlvth (36) -> zirysk, orpjw, zdxscz\n\
                 \jlofqwz (13)\n\
                 \sdktm (23)\n\
                 \bjvuicy (217) -> xjyyfe, rahgf, qqllir\n\
                 \hepkop (7311) -> xkfkucf, xbidr, yvgkdi\n\
                 \gqbwc (25) -> ytxcti, qubli, cpmebw, wzvzgg\n\
                 \yojcz (201) -> rkjuz, rmlru\n\
                 \obwkzhc (86) -> vksnq, tijwlva, szcozjr, krwgy, pnhpv, ydiicdl, kskts\n\
                 \cdqdm (2502) -> wnfqsa, jbqmy, hvdfq\n\
                 \gjcibb (23)\n\
                 \igdtz (83)\n\
                 \phsmt (112) -> jqpdpr, bmnsmqz\n\
                 \hdjzg (77)\n\
                 \jukxlr (29)\n\
                 \oajdx (61)\n\
                 \ktayld (179) -> skfnp, xwjmsjr\n\
                 \dkxzsaq (83)\n\
                 \utewfcr (50)\n\
                 \jljjai (14) -> fhycptc, olepfo, armfpvt\n\
                 \gnughzp (5)\n\
                 \oyienb (16)\n\
                 \kqicqf (15)\n\
                 \ggvwlp (80)\n\
                 \vlbivgc (13370) -> xcxqa, aeatvub, pwmrau, rqisvrh, hepkop, ogmoqb\n\
                 \kczlit (64)\n\
                 \mblvpm (124) -> fbmajm, ofwbsgp\n\
                 \wehdeq (6)\n\
                 \fegaac (206) -> ffsehyc, sapwhr\n\
                 \qpsirr (15)\n\
                 \gisiv (80) -> hmjueiq, unqui\n\
                 \xjkquk (87)\n\
                 \rsdub (61)\n\
                 \gzxddd (46)\n\
                 \oxsewk (51)\n\
                 \ahfdt (234)\n\
                 \wafjqj (80)\n\
                 \mhjeza (93)\n\
                 \bljkg (12) -> yivjj, cxcyrd, lorxjw\n\
                 \fkapr (39) -> wwofru, weyfsg, khtooum, ohsyhln\n\
                 \dtfdn (71)\n\
                 \zxgrq (25)\n\
                 \rlfqf (63)\n\
                 \hvisx (68)\n\
                 \laopkn (40)\n\
                 \zvszwl (50)\n\
                 \gorpw (55) -> jnrnwos, rsdub, uaffk\n\
                 \skmbdhz (54) -> scqtkga, xdojlm\n\
                 \ecaiau (424) -> rakfg, ddwursx, nsbzfgy\n\
                 \bfwnv (6)\n\
                 \uhvtpfy (47)\n\
                 \zafggcz (17)\n\
                 \qkrpzl (170) -> kjonvut, clbbi\n\
                 \bvmgrs (75)\n\
                 \iicpkf (16) -> vhkydm, htecpc\n\
                 \rbuwrpw (17)\n\
                 \funnv (5679) -> cdlzi, fpfpv, bqxnoid\n\
                 \flkkr (74)\n\
                 \brzucfh (39)\n\
                 \lfavcfd (72)\n\
                 \dmvcduz (38)\n\
                 \izdhn (1183) -> uytsra, xxmtvr, bljkg\n\
                 \hrnrjrt (9135) -> kuufl, khwbzl, tocvooe\n\
                 \eiatt (291) -> gfhummb, jsmde\n\
                 \czvyrzi (52)\n\
                 \ypkhqlq (39)\n\
                 \egxzjn (81)\n\
                 \qzzlmw (319) -> szrkuzi, cpeonw\n\
                 \xepgx (64)\n\
                 \iftyxdd (79) -> xmaqelf, htqps\n\
                 \rskara (87)\n\
                 \uytsdd (292) -> hyehtm, zdissfg\n\
                 \mqodhde (36)\n\
                 \ylqvuk (48) -> shdgsk, fcdcdh, kiylza, arskvgv\n\
                 \gisrnfs (23)\n\
                 \vntsex (77)\n\
                 \rwmdbn (2136) -> xmuxsr, bfkbp, ibjdru, ttvfha, zhohes\n\
                 \fhhgts (38)\n\
                 \opdtk (72)\n\
                 \beewze (66)\n\
                 \leyikdx (1995) -> ewswf, gaashgh, cwnvk\n\
                 \kcbwrrr (631) -> wzbqh, sysdxvb, huzokb, ifuvyo, ghakp, rqqlzs\n\
                 \jwhcmc (72)\n\
                 \mqcflzv (76)\n\
                 \ofwbsgp (58)\n\
                 \hiyswbt (889) -> ileugiu, suuhqpd, yffhk, htstksc\n\
                 \armfpvt (98)\n\
                 \zsknxq (51)\n\
                 \pewxc (246) -> rmexd, wkmtw\n\
                 \lhmgw (19)\n\
                 \qwmqci (38)\n\
                 \hioofm (319)\n\
                 \cujimpt (137) -> ovszp, zsqzm\n\
                 \htstksc (169) -> wsixz, egszxz, gzjut, rutqzk\n\
                 \quwfos (85)\n\
                 \tcjqw (81)\n\
                 \orbcuzi (89)\n\
                 \sybpg (49) -> sdyox, dwrwuoq\n\
                 \qyhvc (16)\n\
                 \sadnqcp (62)\n\
                 \zihpcn (232) -> jukxlr, louebj\n\
                 \zxygs (208) -> njvkdrp, hqqingt\n\
                 \gyoqtcg (77)\n\
                 \emwblax (49)\n\
                 \hewatw (99)\n\
                 \qxkvfid (53)\n\
                 \kglsx (74)\n\
                 \yhfpq (56) -> cxyfam, mjumixz\n\
                 \zivlnu (23)\n\
                 \xsyzhcf (89)\n\
                 \howlyws (206) -> gwyljq, xhhwwso\n\
                 \uycop (59)\n\
                 \yhxlzc (91)\n\
                 \isqvoex (30)\n\
                 \bklfmch (80)\n\
                 \tvrxaw (106) -> qdqtw, qpsirr, dbczwnr\n\
                 \lkreb (72)\n\
                 \kxyfb (90)\n\
                 \jnrnwos (61)\n\
                 \mxbrva (72)\n\
                 \qkhqrq (30)\n\
                 \gfhummb (40)\n\
                 \zwzzce (221) -> ahqfu, gjedup, evhhfo, rpvwtq\n\
                 \rrvbwb (34) -> wcmyn, haclvfu\n\
                 \enlctw (6)\n\
                 \yeaic (61)\n\
                 \otipr (480) -> gdrxgji, fonrd, wqoae\n\
                 \qxkhq (143) -> ixqrl, jsrrt\n\
                 \wbqeo (22)\n\
                 \iugsida (64)\n\
                 \azuoza (44)\n\
                 \yxemuyq (19)\n\
                 \fyouz (18)\n\
                 \bnlbs (38)\n\
                 \hilafgl (59) -> hmpisyb, ktayld, yapaib, bmdgthp, qzzlmw\n\
                 \shdgsk (88)\n\
                 \rnqgy (34)\n\
                 \kmwxj (92)\n\
                 \hmmjjct (9)\n\
                 \mefmo (46)\n\
                 \lwvfsu (53)\n\
                 \fixwkec (84)\n\
                 \haclvfu (61)\n\
                 \werkz (29)\n\
                 \iovxjv (1204) -> uhwnr, ypbrxyq, dfxjjzr, pxkypf, nobfn, tkdvenx, sdfvrod\n\
                 \dmglcj (17)\n\
                 \qprenhy (221) -> cxfsoh, mrmbyj\n\
                 \qmwmbsk (804) -> tmoui, amtayi, wgqpt, xaycmtu, kztkif\n\
                 \zywvdda (52)\n\
                 \ntkpthi (6)\n\
                 \jkkqxfr (1135) -> nomeb, fbzvm, gklehu\n\
                 \muptknj (66)\n\
                 \uwnwp (92)\n\
                 \ggwtf (213) -> vkaay, kxdehcg\n\
                 \afywb (87)\n\
                 \xglsp (94) -> ljhlxc, htpblzv\n\
                 \elovaun (38)\n\
                 \qhubjd (59)\n\
                 \exwzzr (1542) -> bchixdc, fphmu, hcxwql\n\
                 \xhhwwso (43)\n\
                 \uevxbyn (170) -> ucaee, yuikqm\n\
                 \pqgiox (50)\n\
                 \edjlm (33)\n\
                 \ypdumo (48)\n\
                 \ehhbjt (26)\n\
                 \cxyfam (98)\n\
                 \bhqlq (82)\n\
                 \abamn (8) -> tsamaj, qojhhod, kcbwrrr, ttfyrk, qqnmzb, tyysd, sjgvkg\n\
                 \sjdanf (49) -> ldbkyg, brtomr, qwfvm\n\
                 \wcjnjpf (57)\n\
                 \xzvln (9)\n\
                 \citaywz (64)\n\
                 \aqtog (66)\n\
                 \khdbe (9)\n\
                 \vksnq (85) -> vqddcl, ezqeusd\n\
                 \fkwbo (91)\n\
                 \jefjzvl (73)\n\
                 \azoutv (72)\n\
                 \aqvtgi (90)\n\
                 \vlyof (97)\n\
                 \gwyljq (43)\n\
                 \xmedt (39)\n\
                 \rsstvn (75) -> bpcnzi, cvpuwrb\n\
                 \vekxdqh (85)\n\
                 \toeyz (23)\n\
                 \pvyvx (99)\n\
                 \pwmrau (9594) -> roogi, ajcbzv, pwnqyt\n\
                 \qahzrif (63)\n\
                 \gzjut (14)\n\
                 \mzyqoc (194) -> yxgwsj, fwabsk\n\
                 \tkdvenx (44) -> sppxnti, lncmhi, jmrlaxf, qmati\n\
                 \vtefqb (68)\n\
                 \yekmflj (64)\n\
                 \pdbykx (14)\n\
                 \fpgyyu (67)\n\
                 \qjbbyb (26)\n\
                 \izzzyqd (186) -> djvfa, qrrvi, junfev\n\
                 \lsire (61685) -> locrtxl, shlfz, ycpcv\n\
                 \vbuvkx (204) -> tlxekcp, pxdkes\n\
                 \ahqfu (5)\n\
                 \cjxyp (81)\n\
                 \aeatvub (10983) -> hghjsk, vksyy, otipr\n\
                 \jhnujj (14)\n\
                 \cxpwfir (63) -> mhpzrw, txwzysl\n\
                 \gcydgf (22)\n\
                 \zlbnkdc (92) -> lfavcfd, lkreb\n\
                 \lrjbgd (41)\n\
                 \casmwo (246) -> nsbnixe, vntsex\n\
                 \rqqlzs (270) -> lfdefc, isqvoex\n\
                 \xtqthxs (44)\n\
                 \kjonvut (27)\n\
                 \mptovq (19)\n\
                 \dwrwuoq (93)\n\
                 \ziiqv (81)\n\
                 \vnfigul (38)\n\
                 \jpynea (88)\n\
                 \rplcrt (90)\n\
                 \flptbw (159) -> xmgqmv, ciprksz\n\
                 \nojly (42)\n\
                 \jbqmy (86) -> zxhqlfy, ehhbjt\n\
                 \ozhydny (40)\n\
                 \zzflc (92) -> rnyndr, eiatt, fvivo, gdylf\n\
                 \jktlfu (47)\n\
                 \njvkdrp (13)\n\
                 \qyurm (76) -> eauxeyl, nrwmjk, qxkvfid, rjmuly\n\
                 \bjyraf (7)\n\
                 \zhpfgzv (47)\n\
                 \qfcetm (30) -> iqoxkhd, gptyqwd\n\
                 \dhfagjw (67)\n\
                 \qriyeb (89)\n\
                 \ucaee (68)\n\
                 \djvkd (36)\n\
                 \scqtkga (54)\n\
                 \yvgkdi (992) -> pjvnmqn, kgoyufq, zivjpfo, amsfvm\n\
                 \zsukqjo (90)\n\
                 \hfmaqp (94)\n\
                 \gxsxqwt (20)\n\
                 \marord (48)\n\
                 \uloppmh (50)\n\
                 \iktmpdq (34)\n\
                 \wnvrg (39)\n\
                 \cxiturs (95) -> ttoer, jpwtbds, yykkph, yffpvf, ahjlf, yoxetv, okkvefs\n\
                 \fewrzd (24) -> efuysje, olrgu, rtmiw\n\
                 \swnan (85)\n\
                 \xdojlm (54)\n\
                 \dhtxpbb (86)\n\
                 \roogi (100) -> cesnj, wsvfkr, hzhcl\n\
                 \yffhk (143) -> jfcoc, vpltn\n\
                 \ffinat (630) -> avyoy, tywzxwb, zuawuo, vsunxw\n\
                 \txrfl (81)\n\
                 \eoustfr (80)\n\
                 \bxmcg (249) -> epggt, gfjsie\n\
                 \kdeqm (99) -> qjbbyb, ikaol\n\
                 \lfsvtih (97) -> aylxc, bekguie\n\
                 \qkhvu (72)\n\
                 \zzfcq (7259) -> balknnd, iiqzvha, kzzfvt, ecaiau\n\
                 \kebhn (106) -> iktmpdq, sreke, cjbdxts, ehlnex\n\
                 \ljmrml (178) -> fxhqq, ybioco\n\
                 \asozcan (96)\n\
                 \ceeotg (53)\n\
                 \fonrd (12)\n\
                 \fvmeeas (88) -> wdipy, khnjt, kmwxj\n\
                 \cejtpyf (71)\n\
                 \wsvfkr (193) -> liznr, yytpewc\n\
                 \evdwf (31)\n\
                 \wqgssb (37)\n\
                 \uhnqr (247) -> oncexf, jeiqx\n\
                 \xzmdis (24) -> yhjhgu, vqnyvr, taacpu\n\
                 \tafhilv (11)\n\
                 \mhpzrw (96)\n\
                 \cgrima (79) -> xvayjwv, eyxccr, xtqthxs, qzftgbx\n\
                 \nrwmjk (53)\n\
                 \yjutt (47) -> jocmdmv, iaoyb, aecsfp, mxbrva\n\
                 \cxcyrd (62)\n\
                 \fwwub (146) -> defbun, wcjnjpf\n\
                 \sapwhr (17)\n\
                 \ihzsljz (46)\n\
                 \zmkwnv (66)\n\
                 \yytpewc (50)\n\
                 \xdctkbj (83) -> zuoeh, tnqram, funnv, zzfcq, xwkyrer, cxiturs, phtghp\n\
                 \kptjhtd (86)\n\
                 \pcecbrn (66)\n\
                 \sdwrx (31)\n\
                 \dfiyju (49)\n\
                 \gxddhu (133) -> itlwpm, bdnjn\n\
                 \zvpboy (76) -> txrfl, egxzjn, iwouvid, cjxyp\n\
                 \fndyvvn (85) -> khtegw, aocfuj, mipqe, lnknp\n\
                 \ozvtqp (53)\n\
                 \kxizh (74) -> yojcz, uafhv, wnpnfiv, kivyltn, jxaorvd\n\
                 \zwzxy (38)\n\
                 \rkjuz (71)\n\
                 \jagdwg (46) -> ytiljvt, smascq\n\
                 \rutqzk (14)\n\
                 \zymggc (39)\n\
                 \afbzsz (148) -> vzcklke, ggvwlp\n\
                 \ymdmn (99)\n\
                 \twoyl (58)\n\
                 \lqcutyt (74)\n\
                 \nlacdac (38)\n\
                 \otikjx (40)\n\
                 \rxzfdg (87)\n\
                 \huvihu (49)\n\
                 \cfbaj (90)\n\
                 \lqlyf (59)\n\
                 \apxgf (38)\n\
                 \nqicerc (62)\n\
                 \iksaub (99)\n\
                 \avyoy (252)\n\
                 \kzzfvt (94) -> aluqao, oherzyz, dwnokzu\n\
                 \uqeag (162) -> prlvn, xtaoisd\n\
                 \crhojk (40) -> yffeit, yfusbw, oykwsk\n\
                 \oxoocfp (237) -> igqle, eukgf, qzglav, ipysrdj, gsgwqk, kevlq\n\
                 \aylxc (31)\n\
                 \khnjt (92)\n\
                 \ytvjxq (260)\n\
                 \xkxqc (64)\n\
                 \ogmoqb (8) -> uqmgmst, hiyswbt, qmwmbsk, skmuo, tszockk, kxizh, thbwh\n\
                 \nvfca (42)\n\
                 \xaycmtu (67) -> cnwzxpy, helyfoo\n\
                 \kklbcs (74)\n\
                 \wqtuhe (341) -> myookpi, gqikhhw\n\
                 \unqui (79)\n\
                 \vhkydm (99)\n\
                 \zcomxf (40)\n\
                 \hsxhyf (63)\n\
                 \rwakmo (80)\n\
                 \uogva (17)\n\
                 \cesnj (57) -> hrokzl, rtgobsq, kmfsmp, chyhykz\n\
                 \rtcfcyn (32)\n\
                 \qckzqv (77)\n\
                 \oixlcn (37)\n\
                 \iaoyb (72)\n\
                 \idrror (34)\n\
                 \bcldmsg (67)\n\
                 \lbxdtms (281)\n\
                 \adbxp (35)\n\
                 \qsjqlp (74)\n\
                 \mjumixz (98)\n\
                 \rtmiw (97)\n\
                 \jzmacb (29)\n\
                 \umgch (64)\n\
                 \rpjozji (279) -> faijmsh, xzmdis, arelp, guvke, rqilp, eqpuuzs\n\
                 \xvayjwv (44)\n\
                 \vgemekb (53)\n\
                 \odpqjr (263)\n\
                 \hekibe (63)\n\
                 \xmaqelf (36)\n\
                 \ivlus (47)\n\
                 \rkwhbhr (50)\n\
                 \pawvr (12)\n\
                 \crcrimv (57)\n\
                 \ukfsn (86)\n\
                 \nfcbi (117) -> zocwx, mjtji\n\
                 \qwfvm (75)\n\
                 \jfieeor (96)\n\
                 \eolqn (91)\n\
                 \bgehlas (6)\n\
                 \ruozk (10)\n\
                 \gqikhhw (54)\n\
                 \pqjua (14)\n\
                 \jtyurkp (239)\n\
                 \wjbdxln (99)\n\
                 \paopwt (77)\n\
                 \fefuzon (126) -> jenfafh, cauig\n\
                 \ifualyn (93)\n\
                 \npccgnv (50)\n\
                 \nvcafwu (11)\n\
                 \htecpc (99)\n\
                 \uxbhu (175) -> bxwng, ozvtqp\n\
                 \gzfrn (365) -> mprgtb, qkicc\n\
                 \qlwhsix (71) -> bjwny, ghapm\n\
                 \uvkxner (46)\n\
                 \kmfel (77)\n\
                 \ytiljvt (97)\n\
                 \cxqeyt (30)\n\
                 \yyursb (93) -> lqcutyt, uuvtlk\n\
                 \mpijr (88)\n\
                 \rpqbv (23)\n\
                 \oginzo (24)\n\
                 \sydjg (10)\n\
                 \ehlnex (34)\n\
                 \ukqmhyc (25)\n\
                 \gshsx (6)\n\
                 \nafrmeo (76)\n\
                 \ifwmfdm (114) -> jibemf, wtfliw\n\
                 \rmexd (59)\n\
                 \ujbzq (41) -> izvtqsa, ssnhc\n\
                 \scxdo (56)\n\
                 \bvmgt (1203) -> xqncgyu, tsxfibs, zofjia\n\
                 \vkaay (13)\n\
                 \pxdkes (42)\n\
                 \witry (76)\n\
                 \ttpmzgm (83)\n\
                 \pxgkg (69)\n\
                 \vwojto (41)\n\
                 \jcise (35)\n\
                 \tbioyr (85)\n\
                 \wnpnfiv (55) -> tehat, ttbuzrh, jfieeor\n\
                 \ejxib (53)\n\
                 \htpblzv (83)\n\
                 \dgdtt (155) -> qface, yhvndwy\n\
                 \weyfsg (53)\n\
                 \aodoc (91)\n\
                 \vmeubf (759) -> sygjhzp, ilhib, ldgyqh, uewdyd, skmbdhz\n\
                 \pwetqid (13)\n\
                 \pudso (45)\n\
                 \ibjdru (136) -> dzqqgbm, qivxs\n\
                 \rtgobsq (59)\n\
                 \kqiuy (81) -> ffuqr, rplcrt, gmuwpyi, zsukqjo\n\
                 \gfszte (23) -> pxgkg, zehkwy, pwnxw, uqfbnlo\n\
                 \ngxtfhu (25)\n\
                 \fphmu (62) -> jpvxzcn, xvzinl, pvyvx, lxgvhy\n\
                 \yxzlpnj (85) -> iyfyi, jhcwkl\n\
                 \khixdho (46)\n\
                 \pjjmau (353) -> hktzoq, oigsk\n\
                 \ttofoep (88)\n\
                 \fhycptc (98)\n\
                 \nsghrq (105) -> bvmgrs, bsfygp\n\
                 \hmdxion (30)\n\
                 \nsbzfgy (167) -> mplhwo, qvdid\n\
                 \hngao (361) -> olhfbr, qgxgzo\n\
                 \iitbuxz (1186) -> eexmf, emuwzd, zzbad\n\
                 \ywnsmem (246) -> qjuuu, ohuvsf\n\
                 \qjsvs (66)\n\
                 \uuyfecv (9)\n\
                 \uafhv (223) -> azmneyd, mmpnppi\n\
                 \aocfuj (91)\n\
                 \kaghlc (34)\n\
                 \eionkb (1079) -> hxmcaoy, sybpg, jfhqrla\n\
                 \hzhcl (127) -> vgegr, lklqxg\n\
                 \ssnhc (84)\n\
                 \ttfyrk (2158) -> xnxsdq, ffgzg, tvrxaw\n\
                 \nvfqmkw (96)\n\
                 \qrrvi (18)\n\
                 \ajcbzv (55) -> jjhrmi, jljjai, afbzsz\n\
                 \ydiicdl (93) -> iqbdxb, fpgyyu\n\
                 \eyxccr (44)\n\
                 \gdkjoit (56)\n\
                 \urktg (196) -> pxgcbfi, lacddy, hvisx\n\
                 \wuclmu (64)\n\
                 \rosfnb (26)\n\
                 \osjsm (87)\n\
                 \kgoyufq (133) -> holen, gjctf\n\
                 \kihqh (80)\n\
                 \xjyyfe (25)\n\
                 \gyfbgkr (16) -> gyoqtcg, lovox, srzfd\n\
                 \bidhw (89)\n\
                 \wfpzhfz (78) -> zyfwjxs, evdwf\n\
                 \rnyndr (149) -> kklbcs, ygkdmh, cifdyio\n\
                 \xqncgyu (25) -> nzhqepw, satjdgz\n\
                 \hvmlb (141) -> qwxwd, huvihu\n\
                 \txwzysl (96)\n\
                 \suuhqpd (48) -> ccpnopa, lqlyf, fxpoal\n\
                 \djviima (31) -> qyhvc, kjoru, myopc\n\
                 \ddguar (116) -> adbxp, jcise\n\
                 \wptyd (87)\n\
                 \obbpd (24)\n\
                 \anoxh (63) -> hfmaqp, ggfmiv\n\
                 \llgbz (167)\n\
                 \mhxheb (167) -> rkfspx, uatlbrq, cvnrr, bwpeux\n\
                 \yybnbso (89)\n\
                 \lxgvhy (99)\n\
                 \yffpvf (1698) -> pwoyfeh, zklbfdg\n\
                 \ttvfha (156)\n\
                 \tocvooe (99) -> fqqyipa, zihpcn, wzqanwj, wajnseu, bnevesk, wwxak\n\
                 \taxrkif (52)\n\
                 \rvixnmq (376) -> fyouz, nsnqedk\n\
                 \uhwnr (60) -> zjzgs, mpijr\n\
                 \djvfa (18)\n\
                 \rjmuly (53)\n\
                 \pnhpv (227)\n\
                 \sjaax (190)\n\
                 \amtayi (29) -> qsvbb, scxdo, inlrm\n\
                 \vbmyyrh (142) -> uwjowb, naekrk\n\
                 \gomcbqb (203) -> lofayaa, iltoh\n\
                 \oijwjli (37)\n\
                 \wajnseu (20) -> kxyfb, vmboh, zguzlx\n\
                 \hghjsk (348) -> fixwkec, gcowt\n\
                 \dzqqgbm (10)\n\
                 \guvke (19) -> brjgwq, kejtzg\n\
                 \jpvxzcn (99)\n\
                 \mplhwo (70)\n\
                 \dblmcye (325) -> bffnszc, zxgrq, ngxtfhu\n\
                 \ahbcl (178) -> hebhue, edlved, tafhilv, iblvki\n\
                 \liznr (50)\n\
                 \pwoyfeh (47)\n\
                 \jdiczst (37)\n\
                 \ejvipa (38) -> kpayh, uzvsml\n\
                 \oherzyz (53) -> yhxlzc, fkwbo, ziyyc, dlfmj\n\
                 \kivyltn (303) -> vxede, pjazwiy, ruozk, sydjg\n\
                 \szcmb (176) -> bjyraf, bvypab\n\
                 \ofxzyhr (22)\n\
                 \xmzzrgs (266) -> aewmad, jefjzvl\n\
                 \gdrxgji (12)\n\
                 \ziyyc (91)\n\
                 \wgqpt (29) -> evcveie, ccter\n\
                 \yykkph (63) -> gyfbgkr, fghxbc, qswoy, gomcbqb, tubhp, zdqmuey, gxddhu\n\
                 \yoxetv (1724) -> eeziziu, kaghlc\n\
                 \xqpfvwx (59)\n\
                 \fxaglf (49)\n\
                 \shjxje (56)\n\
                 \cdlzi (1615) -> wtqxei, mhxheb, nuxxmd\n\
                 \zytau (43)\n\
                 \ghakp (232) -> sagyrje, fxaglf\n\
                 \lbhlxqa (76)\n\
                 \bchixdc (431) -> khdbe, uuyfecv, pnouux\n\
                 \olhnx (1796) -> vymmkdf, qfcetm, atbiby, tcpduh, ymeoz\n\
                 \bvypab (7)\n\
                 \hregcx (66)\n\
                 \aucjw (62)\n\
                 \bmqhvfv (40)\n\
                 \fpfpv (1564) -> fxlbc, alhlvth, yhfpq\n\
                 \lzypz (220) -> rnqgy, csyiik\n\
                 \ujjoydl (38)\n\
                 \rfcbs (197) -> oajdx, yeaic\n\
                 \cmdizw (31) -> ydzibri, syliku\n\
                 \iiqzvha (1325) -> hnedp, iwicpur\n\
                 \zdqsmv (91)\n\
                 \neywe (59) -> lmlsog, svanha, sadnqcp\n\
                 \teyakvf (89)\n\
                 \inlrm (56)\n\
                 \kpayh (34)\n\
                 \spwqxpy (79)\n\
                 \ofnewz (83) -> pryhgj, tcjqw\n\
                 \knqxdq (63)\n\
                 \jtfylv (31)\n\
                 \jhyjqxq (363) -> jlofqwz, bhfui\n\
                 \kmfsmp (59)\n\
                 \kskts (115) -> gdkjoit, lmkwafp\n\
                 \hktzoq (38)\n\
                 \tajfmq (30)\n\
                 \zdxscz (72)\n\
                 \pywmbis (81)\n\
                 \yhsmjfq (29)\n\
                 \kzkfcn (10)\n\
                 \mieqti (16)\n\
                 \mxwbp (235) -> fggyk, mefmo\n\
                 \thrvlt (81)\n\
                 \wqoae (12)\n\
                 \yivjj (62)\n\
                 \aumrixf (40) -> ifualyn, kgqzrt, mhjeza, wfvjnxf\n\
                 \gfigt (211) -> iiugq, zgfqdv\n\
                 \cepxc (38)\n\
                 \vzxktth (76)\n\
                 \locto (240) -> oginzo, twgjdmg\n\
                 \vopqzha (10) -> kglsx, qsjqlp, flkkr, fbpbs\n\
                 \lxwvf (72) -> ixxww, mxnlv, waqca\n\
                 \zuwaw (84) -> tbaads, xjadrfg\n\
                 \oothjv (71)\n\
                 \tubhp (141) -> uftnfv, vgemekb\n\
                 \wywxu (92)\n\
                 \uwjowb (70)\n\
                 \pwzsq (64)\n\
                 \eexmf (130)\n\
                 \ldgyqh (30) -> mriqcjy, khgvmj\n\
                 \ewswf (307)\n\
                 \tbaads (28)\n\
                 \rxsihsa (91)\n\
                 \dtmbf (50)\n\
                 \tzhwvzt (89)\n\
                 \qivxs (10)\n\
                 \nfucnzx (68) -> nvfqmkw, asozcan\n\
                 \znwmvr (63) -> ymataqq, etfbuu, wbqeo, gcydgf\n\
                 \kejtzg (88)\n\
                 \eukgf (112) -> rdvciwk, ulchkal\n\
                 \skpux (146) -> vwftcva, perzy\n\
                 \uewdyd (152) -> uamqx, gnughzp\n\
                 \dnynny (14)\n\
                 \guyrnpn (413) -> bqywl, cvcblhv, ovpzt, qlwhsix\n\
                 \lnmhw (83)\n\
                 \llkaoeh (68)\n\
                 \ydzibri (78)\n\
                 \gaashgh (307)\n\
                 \vbmqj (91)\n\
                 \uqmgmst (1336) -> kdeqm, znwmvr, iftyxdd\n\
                 \tijwlva (187) -> gxsxqwt, yjrfr\n\
                 \fozagvz (37)\n\
                 \tafss (38)\n\
                 \dckbvlg (12)\n\
                 \oncexf (26)\n\
                 \jkkwtd (142) -> jhwrcb, pbkplz, momda\n\
                 \evqibrc (66)\n\
                 \mrwbv (68)\n\
                 \hrokzl (59)\n\
                 \soirl (206) -> uqjfarv, myqre\n\
                 \ubuge (186)\n\
                 \rtutzu (73) -> crcrimv, fxrijc\n\
                 \pmefov (983) -> gibdxij, whvvemg, lfsvtih, ckmftuc\n\
                 \tnqram (7095) -> kxwbdvm, rhcxf, nihiexp\n\
                 \dzfclsm (186) -> yxemuyq, mptovq\n\
                 \pjazwiy (10)\n\
                 \mnqii (16)\n\
                 \uqjfarv (8)\n\
                 \xnxsdq (76) -> ukqmhyc, teduvv, lmhamlz\n\
                 \lnwcryv (62)\n\
                 \lovaf (94) -> osjsm, wptyd\n\
                 \rhcxf (84) -> jgrsa, egtruqh, kqiuy, aduikk\n\
                 \evcveie (84)\n\
                 \lyhlx (52)\n\
                 \zjzgs (88)\n\
                 \brjgwq (88)\n\
                 \wnfqsa (138)\n\
                 \balknnd (377) -> kebhn, bamxvq, xaogy, fefuzon\n\
                 \ayqbj (64)\n\
                 \zynpp (67) -> qahzrif, rlfqf, hekibe\n\
                 \szglq (194) -> iezyfwf, jmypc, rsizei, jpyvpw\n\
                 \ocppbp (26)\n\
                 \wuknah (36) -> kczlit, nggtuh, umgch, xkxqc\n\
                 \ifnkl (324) -> kabqu, ujjoydl\n\
                 \eqkot (33) -> aljgr, lnwcryv\n\
                 \yjrfr (20)\n\
                 \cvdows (11)\n\
                 \lybaepp (91)\n\
                 \jxaorvd (343)\n\
                 \zkpfzio (145) -> vrbcn, kasaf, hhqmsd, idrror\n\
                 \evbtz (297) -> ifwmfdm, rylaxjf, oylvq, locto\n\
                 \srnnjbb (51) -> zxygs, rkwquj, owxawf, ahfdt\n\
                 \viqvtzw (117) -> gmirjhi, aucjw\n\
                 \nsnqedk (18)\n\
                 \wiapj (55) -> djzjiwd, lsire, vlbivgc, xdctkbj, ygvpk\n\
                 \jhwrcb (90)\n\
                 \zdnypzo (66)\n\
                 \eqpuuzs (149) -> gisrnfs, rpqbv\n\
                 \kevlq (156) -> xkzvo, xxego\n\
                 \fxpoal (59)\n\
                 \dlfmj (91)\n\
                 \pbkplz (90)\n\
                 \qdqtw (15)\n\
                 \qkicc (42)\n\
                 \axgndac (156) -> zdnypzo, sglkjsh\n\
                 \gptyqwd (91)\n\
                 \cwkdlil (46)\n\
                 \tmoui (91) -> ceeotg, ejxib\n\
                 \xxmtvr (154) -> ofxzyhr, dzxpqj\n\
                 \zijzutq (90) -> wuclmu, citaywz, ljjyy\n\
                 \xtaoisd (63)\n\
                 \szcozjr (215) -> bgehlas, pocvrcs\n\
                 \jfhqrla (155) -> miwst, elgtk\n\
                 \nsbnixe (77)\n\
                 \haqaohl (15)\n\
                 \eeune (31) -> ysafyj, vlyof\n\
                 \vgexqw (71)\n\
                 \ghapm (94)\n\
                 \swcvn (1105) -> sjaax, szcmb, klovr\n\
                 \lmhamlz (25)\n\
                 \louebj (29)\n\
                 \fjcobs (6)\n\
                 \holen (27)\n\
                 \qryui (49)\n\
                 \olhfbr (14)\n\
                 \wcmyn (61)\n\
                 \dkmkdfd (173) -> vvkkkpb, ulragq\n\
                 \odqns (87)\n\
                 \xwjmsjr (97)\n\
                 \rqrhrnz (66)\n\
                 \uamqx (5)\n\
                 \rkwquj (92) -> gvamhux, dtfdn\n\
                 \ncmad (23)\n\
                 \lefxyzt (56)\n\
                 \qcmnpm (335)\n\
                 \kgqzrt (93)\n\
                 \ttoer (916) -> howlyws, wuknah, bjvuicy\n\
                 \rahgf (25)\n\
                 \mdqeh (17)\n\
                 \ghdbwu (863) -> ifbhg, nqicerc\n\
                 \thbwh (832) -> rfcbs, hioofm, jspui\n\
                 \gfjsie (90)\n\
                 \mmfuve (51)\n\
                 \vzcklke (80)\n\
                 \bffnszc (25)\n\
                 \saddwx (1569) -> bxmcg, vmpnccn, pjjmau\n\
                 \bmnsmqz (14)\n\
                 \qkawtfu (111) -> ujuunj, iugsida\n\
                 \edlved (11)\n\
                 \pxgcbfi (68)\n\
                 \gekygl (247) -> zafggcz, rbuwrpw\n\
                 \egtruqh (389) -> ocppbp, gwbfat\n\
                 \rvpxob (47)\n\
                 \ympbbx (1243) -> spwqxpy, iedfk, ugcccv, djviima, xgfad\n\
                 \pxkypf (54) -> hblux, nemrt\n\
                 \qqllir (25)\n\
                 \tehat (96)\n\
                 \gibdxij (121) -> ohsvn, wkamonm\n\
                 \itlwpm (57)\n\
                 \rfknc (9)\n\
                 \ekvdv (44) -> kpvbt, nnmayb\n\
                 \gwqgewp (99)\n\
                 \cvnabd (14)\n\
                 \dskuj (165) -> slahk, zytau\n\
                 \yqgesx (175) -> zcomxf, bmqhvfv, hwdtvvc, laopkn\n\
                 \vljjqbw (55)\n\
                 \qmati (48)\n\
                 \afyxhh (87)\n\
                 \ubxvdq (90)\n\
                 \ckegba (32)\n\
                 \sysdxvb (66) -> zmkwnv, pcecbrn, hregcx, muptknj\n\
                 \nihiexp (930) -> vopqzha, uytsdd, uevxbyn\n\
                 \myqre (8)\n\
                 \nwupf (109) -> cuprzhk, ozhydny\n\
                 \tzrqqk (79)\n\
                 \pwvahdb (85) -> yybnbso, tzhwvzt\n\
                 \gcowt (84)\n\
                 \ohsvn (19)\n\
                 \zhohes (46) -> wrlkfij, xlkwyg\n\
                 \ripilxo (299)\n\
                 \vwvowk (1293) -> dgosy, zvgsa\n\
                 \bmlkhaf (53)\n\
                 \kztkif (55) -> mtflvu, oothjv\n\
                 \ycpcv (72) -> izdhn, yzhvrx, eionkb, eadvs, jkkqxfr\n\
                 \zyfwjxs (31)\n\
                 \esphpt (85) -> emwblax, dfiyju, qryui, eydak\n\
                 \jsmde (40)\n\
                 \zguzlx (90)\n\
                 \pcckqq (17)\n\
                 \hxmcaoy (235)\n\
                 \taacpu (57)\n\
                 \ilhib (60) -> pubtxq, lpsafeq\n\
                 \myookpi (54)\n\
                 \olrgu (97)\n\
                 \swnafht (44) -> lbxdtms, jensj, zkpfzio, jobwpao, jxfimbl"
    in
--        do print (massMalloc 0 Set.empty (inputToMap (map read (words input))))
        do print (topoSort (Map.fromList (map inputToMap (lines input))) []) --(topoSort input []))

inputToMap :: String -> (String, [String])
inputToMap x = let spltStr = (splitOn "-> " x) in
    do
        if 1 == (length spltStr)
            then ((head (words (head spltStr))), [])
            else ((head (words (head spltStr))), (splitOn ", " (last (tail spltStr))))