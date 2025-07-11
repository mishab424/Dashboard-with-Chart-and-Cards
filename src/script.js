
  let chart;
  let currentChartType = 'bar';

  // ✅ Step 1: Function to read chart settings from HTML
  function getChartConfig() {
    const configEl = document.getElementById('chart-config');

    const valueType = (configEl?.dataset?.valueType || 'PERCENT').toUpperCase();  // PERCENT, DECIMAL, NUMBER
    const minValue = parseFloat(configEl?.dataset?.minimumValue || '0');
    const maxValue = parseFloat(configEl?.dataset?.maximumRange || (valueType === 'DECIMAL' ? '1' : '100'));
    const stepCount = parseInt(configEl?.dataset?.stepNumber || '5');

    return { valueType, minValue, maxValue, stepCount };
  }

  function getProgressDataFromCards(valueType) {
    const cards = document.querySelectorAll('.progress-card');
    const labels = [];
    const values = [];

    cards.forEach(card => {
      const name = card.querySelector('h4')?.textContent.trim();
      const rawValue = card.getAttribute('data-progress');

      if (!name || rawValue === null) return;

      let value = parseFloat(rawValue);
      if (isNaN(value)) return;

      if (valueType === 'DECIMAL') {
        value = value / 100;
      }

      labels.push(name);
      values.push(value);
    });

    return { labels, values };
  }

  function formatTooltipLabel(valueType, ctx) {
    const label = ctx.label;
    const value = ctx.parsed.y;

    switch (valueType) {
      case 'DECIMAL': return `${label}: ${value.toFixed(2)}`;
      case 'NUMBER': return `${label}: ${value}`;
      case 'PERCENT':
      default: return `${label}: ${value}%`;
    }
  }

  function formatTick(valueType, val) {
    switch (valueType) {
      case 'DECIMAL': return val.toFixed(2);
      case 'NUMBER': return val;
      case 'PERCENT':
      default: return val + '%';
    }
  }

  function renderChart(type = 'bar') {
    const canvas = document.getElementById('lineChart');
    if (!canvas) return;

    const ctx = canvas.getContext('2d');

    // ✅ Read config dynamically
    const { valueType, minValue, maxValue, stepCount } = getChartConfig();

    const { labels, values } = getProgressDataFromCards(valueType);

    if (chart) chart.destroy();

    const stepSize = (maxValue - minValue) / stepCount;

    chart = new Chart(ctx, {
      type: type,
      data: {
        labels: labels,
        datasets: [{
          label: 'Team Progress',
          data: values,
          backgroundColor: type === 'bar'
            ? ['#6366f1', '#8b5cf6', '#3b82f6', '#a78bfa']
            : 'rgba(139, 92, 246, 0.2)',
          borderColor: '#6366f1',
          fill: type === 'line',
          tension: type === 'line' ? 0.4 : 0,
          pointBackgroundColor: '#6366f1',
          pointRadius: 6,
          borderWidth: 2,
          borderRadius: type === 'bar' ? 8 : 0
        }]
      },
      options: {
        responsive: true,
        plugins: {
          legend: { display: false },
          tooltip: {
            callbacks: {
              label: ctx => formatTooltipLabel(valueType, ctx)
            }
          }
        },
        scales: {
          y: {
            beginAtZero: false,
            min: minValue,
            max: maxValue,
            ticks: {
              stepSize: stepSize,
              callback: val => formatTick(valueType, val),
              color: '#6b7280'
            },
            grid: { color: '#e5e7eb' }
          },
          x: {
            ticks: { color: '#6b7280' },
            grid: { display: false }
          }
        }
      }
    });
  }

  function toggleChartType() {
    currentChartType = currentChartType === 'bar' ? 'line' : 'bar';
    renderChart(currentChartType);
  }

  function toggleCardDarkMode() {
    const dashboard = document.getElementById('dashboardCard');
    dashboard?.classList.toggle('dark');
  }

//   function fillProgressBars() {
//     const { valueType } = getChartConfig();

//     document.querySelectorAll('.progress-card').forEach(card => {
//       const rawValue = card.getAttribute('data-progress');
//       const fill = card.querySelector('.progress-fill');

//       if (fill && rawValue) {
//         let percent = parseFloat(rawValue);
//         if (valueType === 'DECIMAL') percent *= 100;

//         if (!isNaN(percent)) {
//           setTimeout(() => {
//             fill.style.width = percent + '%';
//           }, 300);
//         }
//       }
//     });
//   }

function fillProgressBars() {
  const { valueType } = getChartConfig();

  document.querySelectorAll('.progress-card').forEach(card => {
    const rawValue = card.getAttribute('data-progress');
    const fill = card.querySelector('.progress-fill');

    if (fill && rawValue !== null) {
      let percent = parseFloat(rawValue);

      if (valueType === 'DECIMAL') {
        percent *= 100;
      }

      if (!isNaN(percent)) {
        // Set width dynamically based on value
        fill.style.width = percent + '%';
        fill.textContent = (valueType === 'DECIMAL') ? percent.toFixed(2) + '%' :
                           (valueType === 'NUMBER') ? percent :
                           percent + '%';
      }
    }
  });
}


  document.addEventListener('DOMContentLoaded', function () {
    fillProgressBars();
    renderChart(currentChartType);
  });

  apex?.jQuery('#dashboardCard')?.on('apexafterrefresh', function () {
    fillProgressBars();
    renderChart(currentChartType);
  });




   function updateRegionHeaders() {
    const config = document.getElementById('chart-config');
    if (!config) return;

    const header          = config.dataset.header || 'Default Header';
    const regionTitle     = config.dataset.regionTitle || 'Default Region';
    const regionSubtitle  = config.dataset.regionSubtitle || 'Default Subtitle';

    const headerEl        = document.getElementById('header-title');
    const regionTitleEl   = document.getElementById('region-title');
    const regionSubtitleEl = document.getElementById('region-subtitle');

    if (headerEl) headerEl.textContent = header;
    if (regionTitleEl) regionTitleEl.textContent = regionTitle;
    if (regionSubtitleEl) regionSubtitleEl.textContent = regionSubtitle;
  }

  document.addEventListener('DOMContentLoaded', () => {
    updateRegionHeaders();
  });

  // Replace `dashboardCard` with the static ID of your APEX region if needed
  apex.jQuery('#dashboardCard').on('apexafterrefresh', () => {
    updateRegionHeaders();
  });