import os

def build_qemu(skip_configure=False):
  os.chdir('/home/student/qemu')
  if not skip_configure:
    os.system('./configure --target-list=arm-softmmu,arm-linux-user')
  os.system('make')

if __name__ == '__main__':
  from argparse import ArgumentParser

  parser = ArgumentParser()
  parser.add_argument('-sc', '--skip_configure', action='store_true', default=False)

  args = parser.parse_args()
  build_qemu(**vars(args))
