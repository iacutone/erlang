.SUFFIXES: .erl .beam .yrl

.erl.beam:
	erlc -W $<

.yrl.erl:
	erlc -W $<

ERL = erl -boot start_clean

MODS = hello

all: compile
	${ERL} -s hello start

compile: ${MODS:%=%.beam}

# Compile all the modules in the test directory, then run test:start/0, which
# should start the tests
tests: ${TEST_MODS:%=test/%.beam}
	${ERL} -s test start

clean:
	# Clean source
	rm -rf *.beam erl_crash.dump
	# Clean tests
	rm -rf test/*.beam
