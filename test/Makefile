PGSQL_VERSION=42.7.11
MYSQL_VERSION=3.5.8

.PHONY: test
test: reports/ccnet.txt reports/seafile.txt

.PHONY: clean
clean:
	rm reports/ccnet/*
	rm reports/seafile/*

reports/%.txt: drivers \
	reports/%-mysql-clean.json \
	reports/%-mysql-upstream.json \
	reports/%-mysql-legacy.json \
	reports/%-pgsql-clean.json \
	reports/%-pgsql-upstream.json \
	reports/%-pgsql-legacy.json \
	reports/%-pgsql-test.json
	$(eval database := $(patsubst %.txt,%,$(@F)))

	./process_results.sh $(database) > $@

reports/%.json:
	$(eval target := $(subst -, ,$(patsubst %.json,%,$(@F))))
	$(eval database := $(word 1,$(target)))
	$(eval backend := $(word 2,$(target)))
	$(eval testcase := $(word 3,$(target)))

	mkdir -p $(@D)

	./$(backend)/prepare.sh $(database) $(testcase)
	./$(backend)/migrate-$(testcase).sh $(database)
	./$(backend)/snapshot.sh $(database) $(testcase)
	./process_result.sh $@

.PHONY: drivers
drivers: \
	drivers/mariadb.jar \
	drivers/postgresql.jar

drivers/postgresql.jar:
	mkdir -p $(@D)
	wget -nc -O $@ https://repo1.maven.org/maven2/org/postgresql/postgresql/$(PGSQL_VERSION)/postgresql-$(PGSQL_VERSION).jar

drivers/mariadb.jar:
	mkdir -p $(@D)
	wget -nc -O $@ https://repo1.maven.org/maven2/org/mariadb/jdbc/mariadb-java-client/$(MYSQL_VERSION)/mariadb-java-client-$(MYSQL_VERSION).jar
