require 'formula'

class I586ElfGdb < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftp.gnu.org/gnu/gdb/gdb-7.9.tar.xz'
  sha256 '1dabff2168bd8fe3cadf9386e47a47c527ea99ba'

  depends_on 'i586-elf-binutils'
  depends_on 'i586-elf-gcc'

  def install
    ENV['CC'] = '/usr/local/opt/gcc/bin/gcc-5'
    ENV['CXX'] = '/usr/local/opt/gcc/bin/g++-5'
    ENV['CPP'] = '/usr/local/opt/gcc/bin/cpp-5'
    ENV['LD'] = '/usr/local/opt/gcc/bin/gcc-5'

    mkdir 'build' do
      system '../configure', '--target=i586-elf', "--prefix=#{prefix}", "--disable-werror"
      system 'make'
      system 'make install'
      FileUtils.rm_rf share/"locale"
    end
  end
end
