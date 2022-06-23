# See here for image contents: https://hub.docker.com/r/jupyter/datascience-notebook/

FROM condaforge/mambaforge

# Create the user
USER root
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo locales \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN apt-get update \
    && apt-get -y install --no-install-recommends fonts-ipaexfont pandoc

RUN mamba install -y numpy pandas matplotlib seaborn plotly
RUN mamba install -y r r-irkernel r-essentials r-languageserver
RUN pip install --no-cache-dir rpy2 radian flake8 black
RUN Rscript -e "install.packages(c('rmarkdown'), repos = 'http://cran.us.r-project.org')"

RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:en
ENV LC_ALL ja_JP.UTF-8
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN { \
        echo '$if Bash'; \
        echo '  set completion-ignore-case on'; \
        echo '  "\\C-n":history-search-forward'; \
        echo '  "\\C-p":history-search-backward'; \
        echo '  "\\e[A":history-search-backward'; \
        echo '  "\\e[B":history-search-forward'; \
        echo '$endif'; \
    } > /home/$USERNAME/.inputrc
