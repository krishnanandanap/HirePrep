import { useEffect, useRef, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../utils/AuthContext';
import api from '../utils/api';

const TOTAL_TIME = 10 * 60; // 10 minutes in seconds

function TimerBar({ seconds }) {
  const pct = (seconds / TOTAL_TIME) * 100;
  const color = seconds < 60 ? 'var(--red)' : seconds < 180 ? 'var(--yellow)' : 'var(--accent)';
  const mins = String(Math.floor(seconds / 60)).padStart(2, '0');
  const secs = String(seconds % 60).padStart(2, '0');

  return (
    <div>
      <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 6 }}>
        <span style={{ fontSize: 13, color: 'var(--muted)' }}>Time Remaining</span>
        <span style={{ fontWeight: 700, color, fontVariantNumeric: 'tabular-nums' }}>
          {mins}:{secs}
        </span>
      </div>
      <div style={{ height: 6, background: 'var(--surface2)', borderRadius: 4, overflow: 'hidden' }}>
        <div style={{
          height: '100%', width: `${pct}%`,
          background: color, borderRadius: 4,
          transition: 'width 1s linear, background 0.5s',
        }} />
      </div>
    </div>
  );
}

export default function TestPage() {
  const { user } = useAuth();
  const navigate = useNavigate();
  const [questions, setQuestions] = useState([]);
  const [current, setCurrent] = useState(0);
  const [answers, setAnswers] = useState({});   // { [questionId]: "A" | "B" | "C" | "D" }
  const [timeLeft, setTimeLeft] = useState(TOTAL_TIME);
  const [loading, setLoading] = useState(true);
  const [submitting, setSubmitting] = useState(false);
  const timerRef = useRef(null);

  useEffect(() => {
    api.get('/questions').then(({ data }) => {
      setQuestions(data);
      setLoading(false);
    });
  }, []);

  // Start timer once questions are loaded
  useEffect(() => {
    if (loading || submitting) return;
    timerRef.current = setInterval(() => {
      setTimeLeft(t => {
        if (t <= 1) { clearInterval(timerRef.current); handleSubmit(); return 0; }
        return t - 1;
      });
    }, 1000);
    return () => clearInterval(timerRef.current);
  }, [loading]);

  const handleAnswer = (questionId, option) => {
    setAnswers(prev => ({ ...prev, [questionId]: option }));
  };

  const handleSubmit = async () => {
    clearInterval(timerRef.current);
    setSubmitting(true);
    try {
      const { data } = await api.post('/submit', { userId: user.userId, answers });
      navigate('/result', { state: { result: data } });
    } catch {
      alert('Submission failed. Please try again.');
      setSubmitting(false);
    }
  };

  if (loading) {
    return (
      <div className="page-center">
        <div style={{ textAlign: 'center' }}>
          <div style={{ fontSize: 40, marginBottom: 16 }}>⏳</div>
          <p style={{ color: 'var(--muted)' }}>Loading questions…</p>
        </div>
      </div>
    );
  }

  const q = questions[current];
  const answered = Object.keys(answers).length;
  const options = [
    { key: 'A', text: q.optionA },
    { key: 'B', text: q.optionB },
    { key: 'C', text: q.optionC },
    { key: 'D', text: q.optionD },
  ];

  return (
    <div style={{ minHeight: '100vh', padding: '24px 16px' }}>
      <div style={{ maxWidth: 680, margin: '0 auto' }}>

        {/* Header */}
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 24 }}>
          <div>
            <h2 style={{ fontWeight: 700, fontSize: 20 }}>Mock Interview Test</h2>
            <p style={{ color: 'var(--muted)', fontSize: 13, marginTop: 2 }}>
              {answered} of {questions.length} answered
            </p>
          </div>
          <button className="btn btn-outline" onClick={handleSubmit}
            disabled={submitting} style={{ fontSize: 13 }}>
            {submitting ? 'Submitting…' : 'Submit Now'}
          </button>
        </div>

        {/* Timer */}
        <div className="card" style={{ marginBottom: 20, padding: '16px 20px' }}>
          <TimerBar seconds={timeLeft} />
        </div>

        {/* Question navigation dots */}
        <div style={{ display: 'flex', gap: 6, flexWrap: 'wrap', marginBottom: 20 }}>
          {questions.map((qq, i) => (
            <button key={qq.id} onClick={() => setCurrent(i)} style={{
              width: 34, height: 34, borderRadius: 8, border: 'none',
              cursor: 'pointer', fontSize: 12, fontWeight: 600,
              background: i === current
                ? 'var(--accent)'
                : answers[qq.id]
                  ? 'rgba(108,99,255,0.25)'
                  : 'var(--surface2)',
              color: i === current ? '#fff' : answers[qq.id] ? 'var(--accent-light)' : 'var(--muted)',
              transition: 'all 0.15s',
            }}>
              {i + 1}
            </button>
          ))}
        </div>

        {/* Question card */}
        <div className="card" style={{ marginBottom: 16 }}>
          <div style={{ marginBottom: 6, fontSize: 12, color: 'var(--muted)', fontWeight: 600 }}>
            QUESTION {current + 1} / {questions.length}
          </div>
          <h3 style={{ fontSize: 17, fontWeight: 600, lineHeight: 1.5, marginBottom: 24 }}>
            {q.question}
          </h3>

          <div style={{ display: 'flex', flexDirection: 'column', gap: 10 }}>
            {options.map(({ key, text }) => {
              const selected = answers[q.id] === key;
              return (
                <button key={key} onClick={() => handleAnswer(q.id, key)}
                  style={{
                    display: 'flex', alignItems: 'center', gap: 14,
                    padding: '14px 16px', borderRadius: 10,
                    border: `1.5px solid ${selected ? 'var(--accent)' : 'var(--border)'}`,
                    background: selected ? 'var(--accent-dim)' : 'var(--surface2)',
                    color: selected ? 'var(--accent-light)' : 'var(--text)',
                    cursor: 'pointer', textAlign: 'left', fontSize: 14,
                    transition: 'all 0.15s',
                  }}>
                  <span style={{
                    width: 28, height: 28, borderRadius: 8, flexShrink: 0,
                    display: 'flex', alignItems: 'center', justifyContent: 'center',
                    fontWeight: 700, fontSize: 12,
                    background: selected ? 'var(--accent)' : 'var(--surface)',
                    color: selected ? '#fff' : 'var(--muted)',
                    border: `1.5px solid ${selected ? 'var(--accent)' : 'var(--border)'}`,
                  }}>{key}</span>
                  {text}
                </button>
              );
            })}
          </div>
        </div>

        {/* Prev / Next */}
        <div style={{ display: 'flex', justifyContent: 'space-between', gap: 12 }}>
          <button className="btn btn-outline" onClick={() => setCurrent(c => c - 1)}
            disabled={current === 0} style={{ flex: 1 }}>
            ← Previous
          </button>
          {current < questions.length - 1 ? (
            <button className="btn btn-primary" onClick={() => setCurrent(c => c + 1)} style={{ flex: 1 }}>
              Next →
            </button>
          ) : (
            <button className="btn btn-primary" onClick={handleSubmit}
              disabled={submitting} style={{ flex: 1 }}>
              {submitting ? 'Submitting…' : '✓ Submit Test'}
            </button>
          )}
        </div>
      </div>
    </div>
  );
}
