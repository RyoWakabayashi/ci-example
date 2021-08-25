FROM mcr.microsoft.com/cstsectools/codeql-container:latest
RUN sed -i 's/Version:/release/g' /usr/local/startup_scripts/libs/codeql.py

ENV PYTHONIOENCODING=utf-8
ENTRYPOINT ["python3", "/usr/local/startup_scripts/startup.py"]
