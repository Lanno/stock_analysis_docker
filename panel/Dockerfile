# Base Stage
FROM ubuntu:24.10 as base

# Avoid prompts from apt and set timezone (if needed)
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
	libboost-all-dev \
	wget \
	build-essential \
	git \
	&& rm -rf /var/lib/apt/lists/*

# Download and install Miniconda
# Consider specifying a fixed version for reproducibility
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
	&& /bin/bash ~/miniconda.sh -b -p /opt/conda \
	&& rm ~/miniconda.sh

# Add Conda to PATH
ENV PATH /opt/conda/bin:$PATH

# TA-Lib Stage
FROM base as ta-lib

RUN wget https://sourceforge.net/projects/ta-lib/files/ta-lib/0.4.0/ta-lib-0.4.0-src.tar.gz -O ta-lib.tar.gz && \
	tar -xzf ta-lib.tar.gz && \
	cd ta-lib*/ && \
	./configure --prefix=/usr && \
	make && \
	make install

# QuantLib Stage
FROM ta-lib as quantlib

RUN wget https://github.com/lballabio/QuantLib/releases/download/v1.34/QuantLib-1.34.tar.gz -O QuantLib.tar.gz && \
	tar -xzf QuantLib.tar.gz && \
	cd QuantLib*/ && \
	./configure --prefix=/usr && \
	make && \
	make install

# Clone Stage
FROM quantlib as clone

# add credentials on build
ARG SSH_KEY
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan github.com > /root/.ssh/known_hosts && \
    echo "${SSH_KEY}" > /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa

# make sure your domain is accepted
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN git clone git@github.com:Lanno/stock_analysis_panel.git && \
	cd stock_analysis_panel && \
	git checkout c1b66d916bb0eed18594a1325e6840d63e45c67a

RUN git clone git@github.com:Lanno/stock_analysis_library.git && \
	cd stock_analysis_library && \
	git checkout 219cce55f92305c752338ead20674558f9ac4f60

# Final Stage
FROM clone as final

COPY --from=clone /stock_analysis_panel /srv/stock_analysis_panel
COPY --from=clone /stock_analysis_library /srv/stock_analysis_library

RUN cd /srv/stock_analysis_panel && \
	touch .env && \
	make setup

ENTRYPOINT ["sh", "-c", "cd /srv/stock_analysis_panel && make serve"]