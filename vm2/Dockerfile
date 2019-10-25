FROM vashche/hadoop-base
HEALTHCHECK CMD pgrep java || exit 1
ADD run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
