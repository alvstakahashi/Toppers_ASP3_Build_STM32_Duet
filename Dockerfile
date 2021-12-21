# Pull base image.
FROM alvstakahashi/stmtoolchainforduet:1.1

WORKDIR /home/toppers

# Install
#nucleo_f401re_gcc
RUN wget https://www.toppers.jp/download.cgi/asp3_nucleo_f401re_gcc-20200414.zip && \
unzip asp3_nucleo_f401re_gcc-20200414.zip && \
cd asp3 && mkdir obj && cd obj && \
../configure.rb -T nucleo_f401re_gcc -dROM && \
make

#zybo_z7_gcc
RUN wget https://www.toppers.jp/download.cgi/asp3_zybo_z7_gcc-20191009.zip && \
unzip asp3_zybo_z7_gcc-20191009.zip && \
cd asp3_3.5 && mkdir obj && cd obj && \
../configure.rb -T  zybo_z7_gcc  && \
make

# Install
RUN wget https://www.toppers.jp/download.cgi/asp-1.9.3.tar.gz && \
wget https://www.toppers.jp/download.cgi/asp_arch_arm_m4_gcc-1.9.5.tar.gz && \
tar zxf asp-1.9.3.tar.gz && \
tar zxf asp_arch_arm_m4_gcc-1.9.5.tar.gz && \
mkdir -p asp/cfg/cfg && \
chmod 755 /home/cfg/cfg  && \
cp /home/cfg/cfg asp/cfg/cfg/. && \
mkdir -p asp/OBJ && \
cd asp/OBJ  && \
../configure -T stm32f401nucleo_gcc -dROM && \
make depend && make 

WORKDIR /home/toppers

#シェル
CMD ["/bin/bash"]
