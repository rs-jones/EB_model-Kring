%
% plot_2iso_concs_pred(sample_data,iso_plot,predN)
% plot_2iso_concs_pred(sample_data,iso_plot,predN,pred_col)
%
% Plots the predicted nuclide concentrations for each core segment over
% plotted measured nuclide concentrations.
%
% sample_data is a required struct containing necessary sample details, 
% initially created using get_data.m.
%
% iso_plot should contain the handles generated by plot_core_concs.m.
%
% pred_N is a required struct of predicted nuclide concentrations.
%
% pred_col is an optional input to specify the colour used for plotting the
% predicted nuclide concentrations. Default is green.
%
%
%%

function plot_2iso_concs_pred(sample_data,iso_plot,predN,pred_col)

  % Check inputs
  if (nargin < 3 || nargin > 4)
      error('plot_2iso_concs_pred has wrong number of inputs!');
  end
  if (nargin < 4 || isempty(pred_col))
      pred_col = 'g';
  end
  
  
  % Compute production rates for samples and normalise concentrations
  sample_data = norm_concs(sample_data);
  
  % Sort predicted nuclide data to plot; Mix if necessary
  plot_predN = N_to_plot(sample_data,predN); 
  
  
  axes(iso_plot(2));
  hold on;
  
  % Plot predicted nuclide concentrations
  plot(plot_predN.norm_N10,(plot_predN.norm_N26./plot_predN.norm_N10),'o','Color',pred_col,'MarkerFaceColor',pred_col);
  
  hold off;
  
  
end
  