FROM vashche/hadoop-base
HEALTHCHECK CMD pgrep java || exit 1
ADD run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 9870 8088
CMD ["/run.sh"]
