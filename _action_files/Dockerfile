<<<<<<< HEAD
FROM hamelsmu/fastpages-nbdev
=======
FROM fastai/jekyll:2020-12-30
>>>>>>> template/master

WORKDIR /fastpages
COPY . .
RUN chmod u+x action_entrypoint.sh
RUN chmod u+x word2post.sh
<<<<<<< HEAD
=======
RUN dos2unix /fastpages/*.sh
>>>>>>> template/master

CMD [ "/fastpages/action_entrypoint.sh" ]
