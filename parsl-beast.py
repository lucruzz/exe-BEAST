import parsl
import os
from parsl.app.app import python_app, bash_app
from parsl.configs.local_threads import config
from pathlib import Path

parsl.config.retries = 2
parsl.load(config)

p = Path('.')
fasta = list(p.glob('./*.xml'))

@bash_app
def beast(in_file, stderr = parsl.AUTO_LOGNAME, stdout = parsl.AUTO_LOGNAME):
    return 'beast -beagle_gpu -beagle_order 1 {}'.format(in_file)

for i in fasta:
    beast_future = beast(i)
    beast_future.result()
