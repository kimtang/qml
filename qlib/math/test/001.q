
.import.require`math;

.qtx.testSuite[`test.qml.math;"test math"]
  .qtx.repo[`qml]
  .qtx.lib[`math]
  .qtx.testCase[`.math.special_functions;"special_functions"][
    .qtx.shouldTrue["description";{1.0e-6 > sum abs -0.022564575 0 0.022564575 - .math.special_functions.erf.fnc x:-0.02 0.0 0.02}]
    .qtx.shouldTrue["description";{1.0e-6 > sum abs 1.1171516 1.1283792 1.1171516f - .math.special_functions.erf.dt x:-0.1 0.0 0.1 }]            
    .qtx.nil
    ]
  .qtx.testCase[`.math.distributions;"distributions"][
    .qtx.shouldTrue["description";{1.0e-6 > sum abs 0.3969525 0.3989423 0.3969525f - .math.distributions.normal1d.pdf[`] -0.1 0.0 0.1}]
    .qtx.shouldTrue["description";{1.0e-6 > sum abs 0.4601721 0.5 0.5398279f - .math.distributions.normal1d.cdf[`] -0.1 0.0 0.1}]  
    .qtx.shouldTrue["description";{1.0e-1 > sum abs 0 1f - (avg;dev)@\: x:.math.distributions.normal1d.random.boxmueller[`mean`std!0 1f]100000}]
    .qtx.should["description";{[allData]
      r:.bt.md[`rnd]rnd:.math.distributions.normalmd.random[arg:`mean`std#allData]n:1000000;
      .qtx.out[r;] 1e-2>sum abs arg[`mean] - avg @'rnd
      }]
    .qtx.shouldTrue["description";{[rnd;std]
      m:@[;0 3 1] raze std mmu std;
      1e-2>sum abs m - avg @'(rnd * rnd),enlist prd rnd
      }]      
    .qtx.addArg[`mean`std!(0 0f;2 cut 1 .5 .5 1)]
    .qtx.nil
    ]

  .qtx.testCase[`.math.linalg;"distributions"][
    .qtx.shouldTrue["cholcov";{1.0e-6 > sum abs 2 6 -8 0 1 5 -0 -0 3f - raze .math.linalg.cholcov 3 cut 4 12 -16 12 37 -43 -16 -43 98f}]
    .qtx.nil
    ]    
  .qtx.nil