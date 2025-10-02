% Test predictor for the defenseStocks folder using plotPredict5Days

% Load plot_data from the main folder (not inside defenseStocks)
data_path = fullfile('plot_data.mat');
if exist(data_path, 'file')
    s = load(data_path);
    if isfield(s, 'plot_data')
        plot_data = s.plot_data;
    else
        error('plot_data variable not found in plot_data.mat.');
    end
else
    error('plot_data.mat not found in the main folder.');
end

% Specify the field to use for prediction (e.g., 'Close')
field_name = 'Close'; % Change as needed

function predictions = plotPredict5Days(plot_data, field_name)
% plotPredict5Days predicts and plots the next 5 days using data from plot_data.
%   plot_data: struct/table with your time series data
%   field_name: string, the field/column to use for prediction (e.g., 'Close')
%
%   Returns:
%       predictions: vector of predicted values for the next 5 days

    num_days = 5;

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

    % Simple linear regression for prediction
    X = (1:n)';
    y = data;

    coeffs = polyfit(X, y, 1);

    % Predict next 5 days
    X_future = (n+1:n+num_days)';
    predictions = polyval(coeffs, X_future);

    % Plot original data and predictions
    figure;
    plot(X, y, 'b-o', 'DisplayName', 'Historical Data');
    hold on;
    plot(X_future, predictions, 'r--*', 'DisplayName', 'Predicted Next 5 Days');
    xlabel('Day');
    ylabel(field_name);
    legend;
    title(['Prediction for Next 5 Days: ', field_name]);
    hold off;
end

% Call the prediction function and store the result
predictions = plotPredict5Days(plot_data, field_name);

% Display predicted values
disp('Predicted values for the next 5 days:');
disp(predictions);