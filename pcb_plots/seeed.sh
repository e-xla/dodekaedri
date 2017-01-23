#!/bin/bash
# change file names to those seeedstudio wants
FROM_PATH=.
TO_PATH=../gerber
FROM_PCBNAME=dodekaedri
PCBNAME=dodekaedri

FROM=$FROM_PATH/$FROM_PCBNAME
TO=$TO_PATH/$PCBNAME
mv $FROM-B.Cu.gbl $TO.GBL
mv $FROM-B.Mask.gbs $TO.GBS
mv $FROM-B.SilkS.gbo $TO.GBO
mv $FROM-F.Cu.gtl $TO.GTL
mv $FROM-F.Mask.gts $TO.GTS
mv $FROM-F.SilkS.gto $TO.GTO
mv $FROM-In1.Cu.g2 $TO.GL2
mv $FROM-In2.Cu.g3 $TO.GL3
mv $FROM.drl $TO.TXT
mv $FROM-Edge.Cuts.gm1 $TO.GML
cd $TO_PATH
zip -r $PCBNAME.zip $PCBNAME.GTL $PCBNAME.GBL $PCBNAME.GTS $PCBNAME.GBS $PCBNAME.GTO $PCBNAME.GBO $PCBNAME.GL2 $PCBNAME.GL3 $PCBNAME.TXT $PCBNAME.GML
