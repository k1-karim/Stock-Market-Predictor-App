% filepath: c:\Users\kawth\OneDrive\Documents\StockPredictorApp\plotPredict10Days.m
function predictions = plotPredict10Days(plot_data, field_name, num_days)
% plotPredict10Days predicts the next num_days using data from plot_data.
%   plot_data: struct/table with your time series data
%   field_name: string, the field/column to use for prediction (e.g., 'Close')
%   num_days: number of days to predict (default: 10)
%
%   Returns:
%       predictions: vector of predicted values for the next num_days

    if nargin < 3
        num_days = 10;
    end

    % Extract the relevant data
    if isstruct(plot_data)
        data = plot_data.(field_name);
    elseif istable(plot_data)
        data = plot_data.(field_name);
    else
        error('plot_data must be a struct or table.');
    end

    data = data(:); % Ensure column vector
    n = length(data);

    % Example: Simple linear regression for prediction
    X = (1:n)';
    y = data;

    % Fit linear model
    coeffs = polyfit(X, y, 1);

    % Predict next num_days
    X_future = (n+1:n+num_days)';
    predictions = polyval(coeffs, X_future);
end