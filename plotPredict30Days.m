function predictions = plotPredict30Days(plot_data, field_name)
% plotPredict30Days predicts and plots the next 30 days using data from plot_data.
%   plot_data: struct/table with your time series data
%   field_name: string, the field/column to use for prediction (e.g., 'Close')
%
%   Returns:
%       predictions: vector of predicted values for the next 30 days

    num_days = 30;

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

    % Predict next 30 days
    X_future = (n+1:n+num_days)';
    predictions = polyval(coeffs, X_future);

    % Plot original data and predictions
    figure;
    plot(X, y, 'b-o', 'DisplayName', 'Historical Data');
    hold on;
    plot(X_future, predictions, 'r--*', 'DisplayName', 'Predicted Next 30 Days');
    xlabel('Day');
    ylabel(field_name);
    legend;
    title(['Prediction for Next 30 Days: ', field_name]);
    hold off;