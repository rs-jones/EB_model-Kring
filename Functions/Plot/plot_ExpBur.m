%
% out = plot_ExpBur(exposed_or_not,ts_plot)
% out = plot_ExpBur(exposed_or_not,ts_plot,conc_plot)
%
% Plots the episodes of exposure (orange) or burial (blue) computed
% through time, below the corresponding time-series data (plotted with 
% plot_time_series.m).
%
% Requires the output generated by time_series_logical.m or
% ice_surface_logical.m (exposed_or_not), and the plot handles generated by
% plot_time_series.m (ts_plot).
%
% conc_plot (plot handles from plot_core_concs.m or plot_2isotope_concs.m) 
% can be optionally included, but only if it was also used to generate 
% ts_plot.
%
% Outputs are handles for the figure, concentrations subplot (if initially 
% plotted), time-series subplot, and exposure vs. burial subplot, in that 
% order.
%
%
%%

function out = plot_ExpBur(exposed_or_not,ts_plot,conc_plot)
  
  % Check inputs
  if (nargin > 3)
      error('plot_ExpBur has too many inputs!');
  end
  
  if (nargin < 3)
      EB_a = ts_plot.EB_a;
      fontsize = 11;
  else
      EB_a = conc_plot(4);
      fontsize = 10;
  end

  % Check time data
  if max(exposed_or_not.time) > 1000000
      time = exposed_or_not.time / 1000000;
  elseif max(exposed_or_not.time) > 1000
      time = exposed_or_not.time / 1000;
  else
      time = exposed_or_not.time;
  end
  
  % Create exposure-burial array, adjust to deal with present-day
  EB_array = fliplr(exposed_or_not.logical(1:end-1));

  
  axes(EB_a);
  image([min(time) max(time)],[0 1],EB_array);
  %colormap([0.40,0.66,0.81; 0.93,0.23,0.17]);
  colormap([0.40,0.66,0.81; 0.847,0.371,0.0078]);
  
  EB_a.YTick = [];
  ts_plot.ts_a.XTick = []; 
  EB_a.XLim = [min(time) max(time)];
  
  % Check axes
  if max(exposed_or_not.time) > 1000000
      xlabel('Time (Ma before present)');
  elseif max(exposed_or_not.time) > 1000
      xlabel('Time (ka before present)');
  else
      xlabel('Time (years before present)');
  end
  
  set(EB_a,'FontSize',fontsize);

  
  % Export handles
  if (nargin < 3)
      out = [ts_plot.fig ts_plot.ts_a EB_a];
  else
      out = [conc_plot(1) conc_plot(2) ts_plot.ts_a EB_a];
  end
      

end