% Import raw data as csv file (can be changed to live feed from motors)
raw_data = csvread("MX64-PP-PV.csv");

% Get present position data from output graph file
present_position = raw_data(7:end,3);

% Using peak detection, get the peaks within the data, and then get standard deviation / mean for later calculations
t_out = 0:1:size(present_position, 1)-1;
pp_smooth = sgolayfilt(sgolayfilt(present_position));
[pks idx] = findpeaks(pp_smooth, "MinPeakDistance", round(44));
pp_std = std(pks)
pp_avg = mean(pks)

% Error catching variable set up
error_catch = 0;
error_location = {0,0};

% For loop to iterate through pks to see if any of the peaks are within standard deviation of the stuck position (mean)
for index_for_pks = 1:length(pks)
  if ((pks(index_for_pks) > (pp_avg - pp_std)) & (pks(index_for_pks) < (pp_avg + pp_std)))
    ++error_catch;
  endif
  if error_catch >= 3
    error_location{1} = idx(index_for_pks);
    error_location{2} = pks(index_for_pks);
    break;
  endif
endfor

% Convert raw tick value to degrees for output
y_loc = error_location{2} * 0.088;

% Plot information to visually show the information
subplot(1, 1, 1)
plot(t_out,pp_smooth,error_location{1},error_location{2},'-o;Error Stop;')
xlabel(['X Location = ', num2str(error_location{1}), '                         Y Location = ', num2str(y_loc), ' degrees'])
axis tight