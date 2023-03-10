%
% sp=samppars14(sampledata)
%
% Extracts sample parameters from a carbon-14 sample vector and puts them
% into sp.
%
function sp=samppars14(sampledata)
%
% Make sure that sampledata is a vector rather than an array!
%
if (min([size(sampledata,1); size(sampledata,2)]) > 1)
  error('sampledata must be a vector!');
end
%
% Make sampledata a column vectors if it isn't already.
%
if (size(sampledata,1)==1)
  sampledata=sampledata';
end
%
% First, check that the input data is reasonable.
%
if (length(sampledata) ~= 13)
  error('sampledata has wrong size!');
end
%
% Setup the values of sample parameters.
%
sp.latitude=sampledata(1);
sp.longitude=sampledata(2);
sp.elevation=sampledata(3);
sp.P=sampledata(4);
sp.ls=sampledata(5);
sp.rb=sampledata(6);
sp.ST=sampledata(7);
sp.epsilon=sampledata(8);
sp.concentration14=sampledata(9);
sp.inheritance14=sampledata(10);
sp.Lambdafe=sampledata(11);
sp.depthtotop=sampledata(12);
%
% The year the sample was collected determines the final point in
% time for integration of nuclide production.  This also depends on
% the time axis of the geomagnetic history being used.  Currently,
% "t=0" means "2010."  However, this will eventually change when a
% new geomagnetic history is provided.  Here, we computed tfinal
% based on the current geomag history, which ends in 2010.
%
sp.tfinal=(sampledata(13)-2010)/1000;
