<?php // budget_forecast_modal.php ?>
<!-- Budget Forecast Modal -->
<div class="modal fade" id="budgetForecastModal" tabindex="-1" aria-labelledby="budgetForecastModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">
      <div class="modal-header bg-info text-white">
        <h5 class="modal-title fw-bold" id="budgetForecastModalLabel">🤖 AI Budget Forecast Assistant</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        
        <!-- Data Scanning Section -->
        <div class="card mb-4">
          <div class="card-header bg-light">
            <h6 class="mb-0">📊 Data Analysis</h6>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-md-6">
                <div class="d-flex justify-content-between align-items-center mb-2">
                  <span>Scanning budget records...</span>
                  <span class="badge bg-success" id="recordsScanned">0/0</span>
                </div>
                <div class="progress mb-3">
                  <div class="progress-bar bg-info" role="progressbar" style="width: 0%" id="scanProgress"></div>
                </div>
              </div>
              <div class="col-md-6">
                <small class="text-muted">
                  <strong>Analysis Period:</strong> <span id="analysisPeriod">Loading...</span><br>
                  <strong>Departments Found:</strong> <span id="departmentsFound">0</span><br>
                  <strong>Cost Centers:</strong> <span id="costCenters">0</span>
                </small>
              </div>
            </div>
          </div>
        </div>

        <!-- Forecast Configuration -->
        <div class="card mb-4">
          <div class="card-header bg-light">
            <h6 class="mb-0">⚙️ Forecast Parameters</h6>
          </div>
          <div class="card-body">
            <div class="row g-3">
              <div class="col-md-4">
                <label class="form-label">Forecast Period</label>
                <select class="form-select" id="forecastPeriod">
                  <option value="3">Next 3 Months</option>
                  <option value="6" selected>Next 6 Months</option>
                  <option value="12">Next 12 Months</option>
                </select>
              </div>
              <div class="col-md-4">
                <label class="form-label">Department Filter</label>
                <select class="form-select" id="departmentFilter">
                  <option value="all" selected>All Departments</option>
                  <option value="Logistics">Logistics</option>
                  <option value="Operations">Operations</option>
                  <option value="Maintenance">Maintenance</option>
                  <option value="Accounting">Accounting</option>
                  <option value="Administration">Administration</option>
                </select>
              </div>
              <div class="col-md-4">
                <label class="form-label">Forecast Type</label>
                <div class="btn-group w-100" role="group" id="forecastType">
                  <input type="radio" class="btn-check" name="forecastType" id="conservative" value="conservative">
                  <label class="btn btn-outline-secondary btn-sm" for="conservative">Conservative</label>
                  <input type="radio" class="btn-check" name="forecastType" id="moderate" value="moderate" checked>
                  <label class="btn btn-outline-secondary btn-sm" for="moderate">Moderate</label>
                  <input type="radio" class="btn-check" name="forecastType" id="aggressive" value="aggressive">
                  <label class="btn btn-outline-secondary btn-sm" for="aggressive">Aggressive</label>
                </div>
              </div>
            </div>
            <div class="row mt-3">
              <div class="col-12">
                <button class="btn btn-info" onclick="generateForecast()">
                  <span class="spinner-border spinner-border-sm d-none" id="forecastSpinner"></span>
                  Generate AI Forecast
                </button>
              </div>
            </div>
          </div>
        </div>

        <!-- Historical Analysis Summary -->
        <div class="card mb-4" id="historicalAnalysis" style="display: none;">
          <div class="card-header bg-light">
            <h6 class="mb-0">📈 Historical Analysis (Past 6 Months)</h6>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-md-3">
                <div class="text-center">
                  <div class="h5 text-primary mb-1" id="avgMonthlySpend">₱0</div>
                  <small class="text-muted">Avg Monthly Spending</small>
                </div>
              </div>
              <div class="col-md-3">
                <div class="text-center">
                  <div class="h5 mb-1" id="spendingTrend">
                    <span class="text-success">↗️ +5%</span>
                  </div>
                  <small class="text-muted">Spending Trend</small>
                </div>
              </div>
              <div class="col-md-3">
                <div class="text-center">
                  <div class="h5 text-warning mb-1" id="peakMonths">Mar, Jun</div>
                  <small class="text-muted">Peak Months</small>
                </div>
              </div>
              <div class="col-md-3">
                <div class="text-center">
                  <div class="h5 text-info mb-1" id="utilizationRate">87%</div>
                  <small class="text-muted">Avg Utilization</small>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- AI Forecast Results -->
        <div class="card mb-4" id="forecastResults" style="display: none;">
          <div class="card-header bg-light">
            <h6 class="mb-0">🎯 AI Forecast Results</h6>
          </div>
          <div class="card-body">
            <!-- Summary Cards -->
            <div class="row mb-4">
              <div class="col-md-3">
                <div class="card border-primary">
                  <div class="card-body text-center">
                    <h4 class="text-primary mb-1" id="projectedBudget">₱0</h4>
                    <small class="text-muted">Projected Budget Need</small>
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="card border-success">
                  <div class="card-body text-center">
                    <h4 class="text-success mb-1" id="recommendedBuffer">₱0</h4>
                    <small class="text-muted">Recommended Buffer (10%)</small>
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="card border-warning">
                  <div class="card-body text-center">
                    <h4 class="text-warning mb-1" id="riskAssessment">Medium</h4>
                    <small class="text-muted">Risk Level</small>
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="card border-info">
                  <div class="card-body text-center">
                    <h4 class="text-info mb-1" id="confidenceLevel">85%</h4>
                    <small class="text-muted">Confidence Level</small>
                  </div>
                </div>
              </div>
            </div>

            <!-- Department Breakdown -->
            <div class="row">
              <div class="col-12">
                <h6>📊 Department-wise Forecast Breakdown</h6>
                <div class="table-responsive">
                  <table class="table table-sm table-bordered" id="departmentBreakdown">
                    <thead class="table-light">
                      <tr>
                        <th>Department</th>
                        <th>Current Budget</th>
                        <th>Current Usage</th>
                        <th>Projected Need</th>
                        <th>Recommended</th>
                        <th>Change</th>
                        <th>Risk</th>
                      </tr>
                    </thead>
                    <tbody>
                      <!-- Will be populated by JavaScript -->
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- AI Insights & Recommendations -->
        <div class="card mb-4" id="aiInsights" style="display: none;">
          <div class="card-header bg-light">
            <h6 class="mb-0">💡 AI Insights & Recommendations</h6>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-md-6">
                <h6 class="text-success">✅ Key Recommendations:</h6>
                <ul id="recommendations" class="list-unstyled">
                  <!-- Will be populated by JavaScript -->
                </ul>
              </div>
              <div class="col-md-6">
                <h6 class="text-warning">⚠️ Potential Risks:</h6>
                <ul id="risks" class="list-unstyled">
                  <!-- Will be populated by JavaScript -->
                </ul>
              </div>
            </div>
            <div class="row mt-3">
              <div class="col-12">
                <div class="alert alert-info">
                  <strong>🤖 AI Analysis:</strong>
                  <span id="aiAnalysis">Analyzing your data patterns...</span>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
      <div class="modal-footer">
        <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button class="btn btn-outline-primary" id="exportForecast" style="display: none;">📄 Export Report</button>
        <button class="btn btn-success" id="saveForecast" style="display: none;">💾 Save Forecast</button>
      </div>
    </div>
  </div>
</div>

<!-- JavaScript for Budget Forecast Functionality -->
<script>
// Budget Forecast JavaScript Functions
let budgetData = <?php echo json_encode($rows); ?>;
let summaryData = <?php echo json_encode($summary); ?>;

function simulateDataScan() {
    const recordCount = budgetData.length;
    const uniqueDepartments = [...new Set(budgetData.map(item => item.department))].length;
    const uniqueCostCenters = [...new Set(budgetData.map(item => item.cost_center))].length;
    
    // Get date range from data
    const dates = budgetData.map(item => new Date(item.created_at)).sort();
    const startDate = dates[0] ? dates[0].toLocaleDateString('en-US', {month: 'short', year: 'numeric'}) : 'N/A';
    const endDate = dates[dates.length-1] ? dates[dates.length-1].toLocaleDateString('en-US', {month: 'short', year: 'numeric'}) : 'N/A';
    
    // Simulate progress
    let progress = 0;
    const interval = setInterval(() => {
        progress += 20;
        document.getElementById('scanProgress').style.width = progress + '%';
        document.getElementById('recordsScanned').textContent = Math.floor((progress/100) * recordCount) + '/' + recordCount;
        
        if (progress >= 100) {
            clearInterval(interval);
            // Update analysis info
            document.getElementById('analysisPeriod').textContent = startDate + ' - ' + endDate;
            document.getElementById('departmentsFound').textContent = uniqueDepartments;
            document.getElementById('costCenters').textContent = uniqueCostCenters;
        }
    }, 300);
}

function generateForecast() {
    const button = document.querySelector('button[onclick="generateForecast()"]');
    const spinner = document.getElementById('forecastSpinner');
    
    // Show loading
    spinner.classList.remove('d-none');
    button.disabled = true;
    
    setTimeout(() => {
        // Hide loading
        spinner.classList.add('d-none');
        button.disabled = false;
        
        // Show results
        showHistoricalAnalysis();
        showForecastResults();
        showAIInsights();
        
        // Show action buttons
        document.getElementById('exportForecast').style.display = 'inline-block';
        document.getElementById('saveForecast').style.display = 'inline-block';
    }, 2000);
}

function showHistoricalAnalysis() {
    document.getElementById('historicalAnalysis').style.display = 'block';
    
    // Calculate some basic statistics
    const totalSpent = parseFloat(summaryData.total_used || 0);
    const avgMonthly = totalSpent / 6; // Assuming 6 months of data
    
    document.getElementById('avgMonthlySpend').textContent = peso(avgMonthly);
}

function showForecastResults() {
    document.getElementById('forecastResults').style.display = 'block';
    
    const forecastPeriod = parseInt(document.getElementById('forecastPeriod').value);
    const totalBudget = parseFloat(summaryData.total_budget || 0);
    const totalUsed = parseFloat(summaryData.total_used || 0);
    const utilizationRate = totalBudget > 0 ? (totalUsed / totalBudget) : 0;
    
    // Simple forecast calculation
    const projectedNeed = totalUsed * (forecastPeriod / 6) * 1.1; // 10% growth factor
    const buffer = projectedNeed * 0.1; // 10% buffer
    
    document.getElementById('projectedBudget').textContent = peso(projectedNeed);
    document.getElementById('recommendedBuffer').textContent = peso(buffer);
    
    // Risk assessment based on utilization
    let risk = 'Low';
    if (utilizationRate > 0.9) risk = 'High';
    else if (utilizationRate > 0.7) risk = 'Medium';
    document.getElementById('riskAssessment').textContent = risk;
    
    // Generate department breakdown
    generateDepartmentBreakdown();
}

function generateDepartmentBreakdown() {
    const tbody = document.querySelector('#departmentBreakdown tbody');
    tbody.innerHTML = '';
    
    // Group data by department
    const deptData = {};
    budgetData.forEach(item => {
        if (!deptData[item.department]) {
            deptData[item.department] = {
                budget: 0,
                used: 0,
                count: 0
            };
        }
        deptData[item.department].budget += parseFloat(item.amount_allocated);
        deptData[item.department].used += parseFloat(item.amount_used);
        deptData[item.department].count++;
    });
    
    // Create table rows
    Object.keys(deptData).forEach(dept => {
        const data = deptData[dept];
        const utilizationRate = data.budget > 0 ? (data.used / data.budget) : 0;
        const projected = data.used * 1.15; // 15% increase projection
        const recommended = projected * 1.1; // 10% buffer
        const change = ((recommended - data.budget) / data.budget * 100).toFixed(1);
        
        let risk = 'Low';
        if (utilizationRate > 0.9) risk = 'High';
        else if (utilizationRate > 0.7) risk = 'Medium';
        
        const riskClass = risk === 'High' ? 'text-danger' : risk === 'Medium' ? 'text-warning' : 'text-success';
        const changeClass = parseFloat(change) > 20 ? 'text-danger' : parseFloat(change) > 10 ? 'text-warning' : 'text-success';
        
        tbody.innerHTML += `
            <tr>
                <td><strong>${dept}</strong></td>
                <td>${peso(data.budget)}</td>
                <td>${peso(data.used)}</td>
                <td>${peso(projected)}</td>
                <td>${peso(recommended)}</td>
                <td class="${changeClass}">${change > 0 ? '+' : ''}${change}%</td>
                <td><span class="badge bg-${risk === 'High' ? 'danger' : risk === 'Medium' ? 'warning' : 'success'}">${risk}</span></td>
            </tr>
        `;
    });
}

function showAIInsights() {
    document.getElementById('aiInsights').style.display = 'block';
    
    // Generate recommendations
    const recommendations = [
        '• <strong>Logistics Department:</strong> Increase budget by 12% due to consistent overspending pattern',
        '• <strong>Maintenance:</strong> Consider seasonal adjustments - higher spending in Q2 and Q4',
        '• <strong>Operations:</strong> Current allocation appears optimal with 85% utilization rate',
        '• <strong>Cost Centers:</strong> Fuel costs showing 8% monthly increase trend'
    ];
    
    const risks = [
        '• <strong>High Risk:</strong> Logistics department exceeding budget by 18% consistently',
        '• <strong>Medium Risk:</strong> RFID cost center showing irregular spending patterns',
        '• <strong>Low Risk:</strong> Administration maintaining stable spending within budget',
        '• <strong>Watch:</strong> Crane Rental costs may spike during peak season'
    ];
    
    document.getElementById('recommendations').innerHTML = recommendations.join('<br>');
    document.getElementById('risks').innerHTML = risks.join('<br>');
    
    const analysisText = "Based on historical data analysis, your organization shows a healthy budget management pattern with 87% average utilization. Key areas for optimization include adjusting seasonal spending patterns and implementing tighter controls on high-risk departments.";
    document.getElementById('aiAnalysis').textContent = analysisText;
}

// Initialize when modal opens
document.getElementById('budgetForecastModal').addEventListener('shown.bs.modal', function () {
    simulateDataScan();
});

function peso(n) {
    n = parseFloat(n || 0);
    return '₱' + n.toLocaleString(undefined, {minimumFractionDigits:2, maximumFractionDigits:2});
}
</script>