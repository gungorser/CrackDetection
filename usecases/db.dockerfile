FROM debian:stretch
RUN apt-get update && apt-get install -y \
	postgresql postgresql-client postgresql-contrib

ARG VERSION=9.6
ENV VERSION $VERSION

RUN sed -i -e 's/peer/trust/g' /etc/postgresql/$VERSION/main/pg_hba.conf
USER postgres

# Create a PostgreSQL role named ``docker`` with ``docker`` as the password and
# then create a database `docker` owned by the ``docker`` role.
# Note: here we use ``&&\`` to run commands one after the other - the ``\``
#       allows the RUN command to span multiple lines.
COPY dbexport.pgsql /mnt/build/
COPY prepare.sh /mnt/build/
WORKDIR /mnt/build
RUN	/etc/init.d/postgresql start && \ 
	./prepare.sh -i dbexport.pgsql

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/$VERSION/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/$VERSION/main/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# Set the default command to run when starting the container
CMD ["sh", "-c", "/usr/lib/postgresql/${VERSION}/bin/postgres -D /var/lib/postgresql/${VERSION}/main -c config_file=/etc/postgresql/${VERSION}/main/postgresql.conf"]




