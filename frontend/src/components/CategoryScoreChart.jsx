import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer, Cell } from 'recharts';

const COLORS = ['#6366f1', '#22c55e', '#f59e0b', '#ef4444', '#3b82f6', '#ec4899'];

export default function CategoryScoreChart({ data }) {
  if (!data || data.length === 0) return null;

  const chartData = data.map(item => ({
    name: item.category,
    score: Math.round(item.percentage),
    display: Math.round(item.percentage) === 0 ? 3 : Math.round(item.percentage),
    correct: item.correctAnswers,
    total: item.totalQuestions,
  }));

  return (
    <div className="card" style={{ padding: '20px 24px', marginBottom: 28 }}>
      <h3 style={{ fontWeight: 600, fontSize: 16, marginBottom: 20 }}>
        📊 Category-wise Performance
      </h3>
      <ResponsiveContainer width="100%" height={220}>
        <BarChart data={chartData} barCategoryGap="30%">
          <XAxis
    dataKey="name"
    tick={{ fontSize: 11, fill: 'var(--muted)' }}
    axisLine={false}
    tickLine={false}
    interval={0}
    angle={-15}
    textAnchor="end"
    height={50}
/>
          <YAxis
            domain={[0, 100]}
            unit="%"
            tick={{ fontSize: 12, fill: 'var(--muted)' }}
            axisLine={false}
            tickLine={false}
          />
          <Tooltip
    cursor={{ fill: 'rgba(255,255,255,0.05)' }}
    contentStyle={{
        background: 'var(--surface)',
        border: '1px solid var(--border)',
        borderRadius: 8,
        fontSize: 13,
        color: 'var(--text)',   
    }}
    labelStyle={{ color: 'var(--text)' }}
    formatter={(value, _, props) => [
        `${props.payload.correct}/${props.payload.total} (${props.payload.score}%)`, // ← use score not display
        'Score'
    ]}
/>
          
          <Bar dataKey="display" radius={[6, 6, 0, 0]}>
            {chartData.map((_, i) => (
              <Cell key={i} fill={COLORS[i % COLORS.length]} />
            ))}
          </Bar>
        </BarChart>
      </ResponsiveContainer>

      {/* Category summary row */}
      <div style={{
        display: 'flex', flexWrap: 'wrap', gap: 12, marginTop: 20,
        paddingTop: 16, borderTop: '1px solid var(--border)'
      }}>
        {data.map((item, i) => (
          <div key={item.category} style={{
            display: 'flex', alignItems: 'center', gap: 8,
            background: 'var(--surface2)', borderRadius: 8,
            padding: '8px 14px', fontSize: 13,
          }}>
            <div style={{
              width: 10, height: 10, borderRadius: '50%',
              background: COLORS[i % COLORS.length], flexShrink: 0
            }} />
            <span style={{ color: 'var(--muted)' }}>{item.category}</span>
            <span style={{ fontWeight: 700 }}>{Math.round(item.percentage)}%</span>
            <span style={{ color: 'var(--muted)', fontSize: 11 }}>
              ({item.correctAnswers}/{item.totalQuestions})
            </span>
          </div>
        ))}
      </div>
    </div>
  );
}