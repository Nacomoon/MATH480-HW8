︠c75f1513-d6d9-458d-bf34-22ac9acd3acdi︠
%hide
%md
## Myself playing Planetside 2

This is a model of myself playing the multiplayer online game called Planetside 2.

I used the code from the lecture as a template but used different numbers and added some expressions.

The first state is me while my team is winning. The second is when the teams are tied. The third is my team losing and the forth is me bored.

The elements of the second list are expressions of my emotions: happy, mad, very mad, scared, serious, bored, really bored.

The numbers are basically just made up but the result I got at the end looks pretty typical of a normal play session of mine. Lots of cursing, but  lots of YEAH! too.
︡84f5f08d-458c-4509-b396-ca78bb04c870︡{"html":"<h2>Myself playing Planetside 2</h2>\n\n<p>This is a model of myself playing the multiplayer online game called Planetside 2.</p>\n\n<p>I used the code from the lecture as a template but used different numbers and added some expressions.</p>\n\n<p>The first state is me while my team is winning. The second is when the teams are tied. The third is my team losing and the forth is me bored.</p>\n\n<p>The elements of the second list are expressions of my emotions: happy, mad, very mad, scared, serious, bored, really bored.</p>\n\n<p>The numbers are basically just made up but the result I got at the end looks pretty typical of a normal play session of mine. Lots of cursing, but  lots of YEAH! too.</p>\n"}︡
︠51f5be74-30fb-4dfe-9768-61a54e0bc78b︠
A = matrix(RR, 4, [.5, .45, 0,  .05,  # winning
                   1/3, 1/3, 1/3, 0,  # tied
                    0,   .45, .5, .05, # losing
                   .25,   .25,   .25, .25]) # bored

emission_symbols = ['YEAH!', '*expletive*', '*clap* *double expletive*', 'HELP!', 'No more messing around', 'ugh', 'zzz']
B = matrix(RR, 4, 7, [.9, .1, 0, 0, 0, 0, 0,
                      .1, .1, 0, .4, .4, 0, 0,
                      0, .7, .1, .1, .1, 0, 0,
                      0 , 0, 0, 0, 0, .1, .9])

initial = [0,1,0,0]

model = hmm.DiscreteHiddenMarkovModel(A, B, initial, emission_symbols)
︡74cadf7b-dd3f-4999-a720-435ee1d8081c︡
︠3bb04fb7-7290-4ff7-9f68-fd369516225d︠
model
︡ddaf1a1f-e55a-4343-871d-7e298e9a5692︡{"stdout":"Discrete Hidden Markov Model with 4 States and 7 Emissions\nTransition matrix:\n[           0.5           0.45            0.0           0.05]\n[0.333333333333 0.333333333333 0.333333333333            0.0]\n[           0.0           0.45            0.5           0.05]\n[          0.25           0.25           0.25           0.25]\nEmission matrix:\n[0.9 0.1 0.0 0.0 0.0 0.0 0.0]\n[0.1 0.1 0.0 0.4 0.4 0.0 0.0]\n[0.0 0.7 0.1 0.1 0.1 0.0 0.0]\n[0.0 0.0 0.0 0.0 0.0 0.1 0.9]\nInitial probabilities: [0.0000, 1.0000, 0.0000, 0.0000]\nEmission symbols: ['YEAH!', '*expletive*', '*clap* *double expletive*', 'HELP!', 'No more messing around', 'ugh', 'zzz']\n"}︡
︠0fdb2cde-d97b-45b0-bf4c-3f1ca9109e8c︠
model.graph().plot(edge_labels=True).show(figsize=6, svg=True)
︡337e41b5-fcd4-4d7b-87a1-75da09c8df3d︡{"file":{"show":true,"uuid":"bddecb4a-8f1f-4089-acc4-cc999dc5aac6","filename":"/mnt/home/8KpqDbg3/.sage/temp/compute4a/9808/tmp_DBfxcK.svg"}}︡
︠a1b299a5-6931-4628-b4e8-fd076001fadb︠
set_random_seed(1); v,w = model.generate_sequence(50)
for z in zip(v,w):
    print z
︡4e651351-32d5-47ad-b251-bb4c1250153b︡{"stdout":"('No more messing around', 1)\n('No more messing around', 2)\n('*expletive*', 2)\n('No more messing around', 2)\n('*expletive*', 2)\n('*clap* *double expletive*', 2)\n('*expletive*', 2)\n('*expletive*', 2)\n('YEAH!', 1)\n('No more messing around', 1)\n('YEAH!', 1)\n('YEAH!', 0)\n('ugh', 3)\n('HELP!', 1)\n('*expletive*', 2)\n('*expletive*', 2)\n('HELP!', 1)\n('YEAH!', 0)\n('YEAH!', 0)\n('No more messing around', 1)\n('*expletive*', 2)\n('*expletive*', 2)\n('*expletive*', 2)\n('HELP!', 1)\n('YEAH!', 0)\n('YEAH!', 0)\n('YEAH!', 0)\n('zzz', 3)\n('*expletive*', 2)\n('*expletive*', 2)\n('*expletive*', 2)\n('zzz', 3)\n('HELP!', 1)\n('*expletive*', 2)\n('*clap* *double expletive*', 2)\n('HELP!', 2)\n('zzz', 3)\n('YEAH!', 0)\n('YEAH!', 0)\n('HELP!', 1)\n('HELP!', 2)\n('*clap* *double expletive*', 2)\n('zzz', 3)\n('YEAH!', 0)\n('zzz', 3)\n('HELP!', 1)\n('YEAH!', 0)\n('HELP!', 1)\n('*expletive*', 0)\n('*expletive*', 1)\n"}︡
︠775d0aec-af5a-4365-97db-f2a3f47ae3db︠
