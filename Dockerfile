FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

USER root

COPY conda-linux-64.lock /tmp/conda-linux-64.lock

RUN conda install --yes --name base --file /tmp/conda-linux-64.lock && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

USER ${NB_UID}

# trigger GitHub Actions build
