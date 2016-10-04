% MATLAB or Octave script to design the SSB filter used in tests

firlen = 31;
clow = -3000;
chigh = -300;
fs = 48000;

cbw = (chigh-clow);
ccenter = (clow+chigh)/2;

%f1 = fir1(firlen-1,cbw / fs);
t = (1:firlen) - ((firlen+1)/2);
f1 = sinc((cbw / fs) * t);
f = f1 .* exp((2j*pi * ccenter/fs) * t);
%f = f1;

% remove DC
f = f - mean(f);

figure(1);
freqz(f);

figure(2);
plot(abs(fft(horzcat(f, zeros(1,1000)))));

f = 32767*f;

strreal = ''
strimag = ''
for v = f
  strreal = horzcat(strreal,',',int2str(real(v)));
  strimag = horzcat(strimag,',',int2str(imag(v)));
end
strreal(2:end)
strimag(2:end)
