// CroneEngine_Chaos
// An engine that exposes various types of chaotic oscillator UGens
// 1. TermanWang

// Inherit methods from CroneEngine
Engine_Chaos : CroneEngine {
	var <synth;

	*new { arg context, doneCallback;
		^super.new(context, doneCallback);
	}
	alloc {
		// Define the synth variable, whichis a function
		synth = {
			arg out, hz=3000, amp=10, impulse_f=50, initx=0.4, inity=2.0, amplag=0.02, hzlag=0.01;
			var amp_, hz_;
			amp_ = Lag.ar(K2A.ar(amp), amplag);
			hz_ = Lag.ar(K2A.ar(hz), hzlag);
                        Out.ar(out,Pan2.ar(
                          0.5*TermanWang.ar(
                            2.0+ SinOsc.ar( hz_,0,amp_),
                            Impulse.kr(impulse_f),
                            0.01,
                            0.01,
                            1.0,
                            1.0,
                            1.0,
                            initx,
                            inity
                          )
                        )
                      );
			//Out.ar(out, (SinOsc.ar(hz_) * amp_).dup);
		}.play(args: [\out, context.out_b], target: context.xg);

                // add param for hz with arguments
                //MouseX.kr(10,10000,'exponential')
		this.addCommand("hz", "f", { arg msg;
			synth.set(\hz, msg[1]);
		});

                // add param for amp with arguments
                // MouseY.kr(0.1,100.0,'exponential')
		this.addCommand("amp", "f", { arg msg;
			synth.set(\amp, msg[1]);
		});

                // add param for impulse_f with arguments
                // MouseX.kr(1,10000, 'exponential')

                // add param for initx with arguments
                // MouseX.kr(0.4,1.2)

                // add param for inity with arguments
                // MouseY.kr(2.0,4.0)
	}
	free {
		synth.free;
	}
}
