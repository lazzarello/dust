Engine_Filterbank : CroneEngine {

	var <parametric;

	*new { arg context, doneCallback;
		^super.new(context, doneCallback);
	}

	alloc {
		SynthDef(\parametric, { arg out,
			inL, inR, gain=0.5,
			freq1, rq1, db1,
			freq2, rq2, db2,
			freq3, rq3, db3,
			freq4, rq4, db4;

			var eq1, eq2, eq3, eq4, in;
			in = [In.ar(inL), In.ar(inR)];
			eq1 = BPeakEQ.ar(in,freq1,rq1,db1,1);
			eq2 = BPeakEQ.ar(eq1,freq2,rq2,db2,1);
			eq3 = BPeakEQ.ar(eq2,freq3,rq3,db3,1);
			eq4 = BPeakEQ.ar(eq3,freq4,rq4,db4,1);
			Out.ar(out, Pan2.ar(eq4*gain));
		}).add;

		context.server.sync;

		parametric = Synth.new(\parametric, [\inL, context.in_b[0], \inR, context.in_b[1], \out, context.out_b], target: context.xg);

		this.addCommand("freq1", "i", { arg msg;
			parametric.set(\freq1, msg[1]);
		});

		this.addCommand("rq1", "f", { arg msg;
			parametric.set(\rq1, msg[1]);
		});
		// this unit is in "dBs" which is a signed integer range around (-100..24) but could go higher. The "db" warp type in the controlspec Lua lib handles this.
		this.addCommand("db1", "i", { arg msg;
			parametric.set(\db1, msg[1]);
		});
		this.addCommand("freq2", "i", { arg msg;
			parametric.set(\freq2, msg[1]);
		});

		this.addCommand("rq2", "f", { arg msg;
			parametric.set(\rq2, msg[1]);
		});

		this.addCommand("db2", "i", { arg msg;
			parametric.set(\db2, msg[1]);
		});
		this.addCommand("freq3", "i", { arg msg;
			parametric.set(\freq3, msg[1]);
		});

		this.addCommand("rq3", "f", { arg msg;
			parametric.set(\rq3, msg[1]);
		});

		this.addCommand("db3", "i", { arg msg;
			parametric.set(\db3, msg[1]);
		});
		this.addCommand("freq4", "i", { arg msg;
			parametric.set(\freq4, msg[1]);
		});

		this.addCommand("rq4", "f", { arg msg;
			parametric.set(\rq4, msg[1]);
		});

		this.addCommand("db4", "i", { arg msg;
			parametric.set(\db4, msg[1]);
		});
	}

	free {
		parametric.free;
	}
}
