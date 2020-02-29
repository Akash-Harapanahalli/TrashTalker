%% ECE 2026 - Lab 03 - Spring 2020
%
% Lab 03 Notes:
%
% * If parameters such as complex amplitude are not specified, you may
%   choose any value for sign-offs.
% * Reminder: cos(A)cos(B) = 0.5[cos(A+B) + cos(A-B)]
% * If you see a arrow (<=====), that means they are for you to fill in


%% In-Lab Exercises: Beat, Piano and DTMF

%% 3.1 

%% 3.1 (a) 
    
% <========= Please finish the 'sigBeatSum.m' in the rar file you download

%% 3.1 (b) 
% Generate beat signal 
% <====== Please fill in the parameters below
SigBeatIn.Amp = 10; %-- B in Equation (3)
SigBeatIn.fc = 15; %-- center frequency in Eq. (3)
SigBeatIn.phic = 0; %-- phase of 2nd sinusoid in Eq. (3)
SigBeatIn.fDelt = 735; %-- modulating frequency in Eq. (3)
SigBeatIn.phiDelt = -2*pi/3; %-- phase of 1st sinusoid 
SigBeatIn.t1 = 1.1; %-- starting time
SigBeatIn.t2 = 5.2; %-- ending time

sigBeatsum = sum2BeatStruct(SigBeatIn);

% Play beat signal
fs = 8000;
soundsc(sigBeatsum.values,fs);  % Notice that your return should be a struct

% Plot spectrogram
% <======= Please type in the arguments for spectrogram/plotspec
% <======= If you are not sure, try help function and ask the TA's
%spectrogram();
% or 
plotspec(sigBeatsum.values,fs,2^10);


%% 3.2

% <======== Please finish the key2sinus.m first before you preceed

% To check if xx is at the correct frequency for the keynum entered.
% spectrogram(xx, 1024, [], [], fs, 'yaxis');

%% 3.3 Generating C-Major Scale

% <======== Please fill in the following parameters
fs = 8000;  % Sampling rate

silence = zeros(1,(length(0:(1/fs):0.1))); % Create vector that represents 0.1 seconds of silence

keynums = [40 42 44 45 47 49 51 52];    % Create vector of keynums in C-Major Scale

% Concatenate notes and silence together
dur = .4; % Note duration
amp = 10 ; 
phase = pi/8;
music_duration = 0.1+(0.5)*length(keynums);  % Total duration of the piece
tt = 0:1/fs:music_duration; % Create time vector for the whole piece
music = zeros(1,length(tt)); % Create data vector for piece
start = 1;  % Starting index, will be updated in your loop.
for i = 1:length(keynums)
    [xx,tt] = key2sinus(keynums(i), 1, 0, fs, dur);
    note = xx;    % Sin signal cooresponding to the key notes
    stop = start+length(silence)+length(tt)-1;    % Stopping index for each silience and note   
    music(start:stop) = [silence,note];   % Update music vector with silience and note
    start = stop-1;   % Update starting index for next silience and note
end

% Play and plot
soundsc(music, fs);
plotspec(music,fs,2^10);
%figure;
%plot(tt, music)
xlabel('Time (s)')
ylabel('Amplitude')
%figure;
%spectrogram(music, 1024, [], [], fs, 'yaxis');

%% 3.4 Dual Tone Signals
Ts = 0.3e-3; %- Sampling period = 3 msec
fsamp = 1/Ts; %- Sampling rate
tt = 0:1/fsamp:0.3;
DTMFsig = cos(2*pi*852*tt+rand(1)) + cos(2*pi*1209*tt+rand(1)); %- Use random phases
xx = zeros(1,round(2/Ts)); %- pre-allocate vector to hold DTMF signals
n1 = round(0.6/Ts); 
n2 = n1+length(DTMFsig)-1;
xx(n1:n2) = xx(n1:n2) + DTMFsig;
soundsc(xx,fsamp); % Listen to a single DTMF signal
plotspec(xx,fsamp); grid on %- View its spectrogram
save('DTMFsig.mat','xx', 'fsamp')
% The two cosines being added in DTMF signals both have large frequencies. 
% The beat effect is created when one cosine with a large frequency (the 
% carrier) is multiplied by another cosine with a small frequency (the 
% delta).



