

.qtx.testSuiter[`adf1;`repo`lib`file!`qml`adf`001;"test adf"]
  .qtx.before[{.bt.md[`loadResult] .import.module`adf}]
  .qtx.testCase[`adf1;"test loaded file"][
    .qtx.shouldTrue[`0;"file loaded successfully";{[loadResult]
      null loadResult`error
      }].qtx.nil  
    ]
  .qtx.testCase[`adf2;"test adf"][
    .qtx.before[{
      f:{[x1;x2]((1 - x1) xexp 2) + 100*(x2 - x1*x1) xexp 2};
      dforward:.adf.forward f;
      dbackward:.adf.backward f;
      pforward1:.adf.forward f[0.4];
      pforward2:.adf.forward f[;0.4];
      pbackward1:.adf.backward f[0.4];
      pbackward2:.adf.backward f[;0.4];
      `f`dforward`dbackward`pforward1`pforward2`pbackward1`pbackward2!(f;dforward;dbackward;pforward1;pforward2;pbackward1;pbackward2)
      }]
    .qtx.shouldData[`0;"test .adf.getb";"%qml%/qlib/adf/testData/adf2/0";{[f]f[0.4;0.4]}]
    .qtx.shouldData[`1;"test .adf.getb";"%qml%/qlib/adf/testData/adf2/1";{[dforward]dforward[0.4;0.4]}]
    .qtx.shouldData[`2;"test .adf.getb";"%qml%/qlib/adf/testData/adf2/2";{[dbackward]dbackward[0.4;0.4]}]

    .qtx.shouldData[`3;"test .adf.getb";"%qml%/qlib/adf/testData/adf2/3";{[pforward1]pforward1[0.4]}]
    .qtx.shouldData[`4;"test .adf.getb";"%qml%/qlib/adf/testData/adf2/4";{[pforward2]pforward2[0.4]}]
    .qtx.shouldData[`5;"test .adf.getb";"%qml%/qlib/adf/testData/adf2/5";{[pbackward1]pbackward1[0.4]}]
    .qtx.shouldData[`6;"test .adf.getb";"%qml%/qlib/adf/testData/adf2/6";{[pbackward2]pbackward2[0.4]}]    

    .qtx.shouldTrue[`7;"test .adf.getb";{[dforward;dbackward]  dforward[0.4;0.5]~dbackward[0.4;0.5]}]    
    .qtx.shouldTrue[`8;"test .adf.getb";{[pforward1;pbackward1]pforward1[0.5]~pbackward1[0.5]}]    
    .qtx.shouldTrue[`9;"test .adf.getb";{[pforward2;pbackward2]pforward2[0.4]~pbackward2[0.4]}]            

    .qtx.after[{}]
    .qtx.nil
    ]
  .qtx.nil
  ;

/