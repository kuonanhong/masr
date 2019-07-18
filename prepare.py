
import glob
import json


labels = set()
names = ['train', 'dev', 'test']
for name in names:
    wavs = glob.glob('data_thchs30/{}/*.wav'.format(name))

    with open('{}.index'.format(name), 'w') as index:
        for wav in wavs:
            txt = wav.replace('/{}/'.format(name), '/data/') + '.trn'
            with open(txt, 'r') as f:
                lines = f.readlines()
            pinyin = lines[1].strip()
            labels.update(pinyin.split(' '))

            index.write('{},{}\n'.format(wav, pinyin))

with open('labels.json', 'w') as f:
    l = list(labels)
    l.insert(0, '_')
    json.dump(l, f)
