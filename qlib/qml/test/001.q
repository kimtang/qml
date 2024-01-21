
.import.require`qml

.qtx.testSuite[`test.qml;"test qml"]
  .qtx.repo[`]
  .qtx.lib[`qml]
  .qtx.testCase[`test.bls;"test black scholes"][
    .qtx.shouldTrue["description";{[bls]
      1e-6>sum abs bls[`prem] - .qml.bls bls
      }]
    .qtx.nil
    ]
  .qtx.addArg[.bt.md[`bls]flip `type_`direct`spot`strike`rate`vola`matur`prem!(`bls`vega`rho`delta`theta`gamma;`call`call`call`call`call`call;100 100 100 100 100 100j;100 100 100 100 100 100j;0.01 0.01 0.01 0.01 0.01 0.01f;0.15 0.15 0.15 0.15 0.15 0.15f;1 1 1 1 1 1f;6.4594842 39.4959024 49.1733512 0.5563284 -2.779476 0.0263306f)]
  .qtx.addArg[.bt.md[`binbaum]flip`type_`direct`spot`strike`rate`vola`matur`num`payoff!(`bls;`call;100;100;0.01;.qml.linspace[0f;0.25;20];1.0;2500;{max enlist[0;x-100]})]  
  .qtx.testCase[`test.qml.1;"test binbaum"][
    .qtx.shouldTrue["description";{[binbaum]
      binbaum:update prem:.qml.bls binbaum from binbaum;
      binbaum:update pprem:.qml.binbaum binbaum from binbaum;
      1e-2>avg abs binbaum[`pprem] - binbaum`prem
      }]
    .qtx.shouldTrue["description";{1b}]
    .qtx.shouldTrue["description";{1b}]    
    .qtx.nil
    ]
  .qtx.testCase[`test.qml.2;"test monte carlo"][
    .qtx.shouldTrue["description";{[bls]
      paths:.qml.paths x:`type_`spot`drift`diffu`matur`steps`repl!(`euler;100f;{[t;s] 0.01 *s };{[t;s] 0.25 * s};1.0;4;1000000);
      1e-1>.qml.bls [bls 0] - exp[-0.01] * avg {max 0,last[x]-100} each paths
      }]
    .qtx.shouldTrue["description";{1b}]
    .qtx.shouldTrue["description";{1b}]    
    .qtx.nil
    ]        
  .qtx.nil