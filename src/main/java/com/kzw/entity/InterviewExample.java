package com.kzw.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class InterviewExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public InterviewExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andInterviewIdIsNull() {
            addCriterion("interview_id is null");
            return (Criteria) this;
        }

        public Criteria andInterviewIdIsNotNull() {
            addCriterion("interview_id is not null");
            return (Criteria) this;
        }

        public Criteria andInterviewIdEqualTo(Integer value) {
            addCriterion("interview_id =", value, "interviewId");
            return (Criteria) this;
        }

        public Criteria andInterviewIdNotEqualTo(Integer value) {
            addCriterion("interview_id <>", value, "interviewId");
            return (Criteria) this;
        }

        public Criteria andInterviewIdGreaterThan(Integer value) {
            addCriterion("interview_id >", value, "interviewId");
            return (Criteria) this;
        }

        public Criteria andInterviewIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("interview_id >=", value, "interviewId");
            return (Criteria) this;
        }

        public Criteria andInterviewIdLessThan(Integer value) {
            addCriterion("interview_id <", value, "interviewId");
            return (Criteria) this;
        }

        public Criteria andInterviewIdLessThanOrEqualTo(Integer value) {
            addCriterion("interview_id <=", value, "interviewId");
            return (Criteria) this;
        }

        public Criteria andInterviewIdIn(List<Integer> values) {
            addCriterion("interview_id in", values, "interviewId");
            return (Criteria) this;
        }

        public Criteria andInterviewIdNotIn(List<Integer> values) {
            addCriterion("interview_id not in", values, "interviewId");
            return (Criteria) this;
        }

        public Criteria andInterviewIdBetween(Integer value1, Integer value2) {
            addCriterion("interview_id between", value1, value2, "interviewId");
            return (Criteria) this;
        }

        public Criteria andInterviewIdNotBetween(Integer value1, Integer value2) {
            addCriterion("interview_id not between", value1, value2, "interviewId");
            return (Criteria) this;
        }

        public Criteria andReidIsNull() {
            addCriterion("reid is null");
            return (Criteria) this;
        }

        public Criteria andReidIsNotNull() {
            addCriterion("reid is not null");
            return (Criteria) this;
        }

        public Criteria andReidEqualTo(Integer value) {
            addCriterion("reid =", value, "reid");
            return (Criteria) this;
        }

        public Criteria andReidNotEqualTo(Integer value) {
            addCriterion("reid <>", value, "reid");
            return (Criteria) this;
        }

        public Criteria andReidGreaterThan(Integer value) {
            addCriterion("reid >", value, "reid");
            return (Criteria) this;
        }

        public Criteria andReidGreaterThanOrEqualTo(Integer value) {
            addCriterion("reid >=", value, "reid");
            return (Criteria) this;
        }

        public Criteria andReidLessThan(Integer value) {
            addCriterion("reid <", value, "reid");
            return (Criteria) this;
        }

        public Criteria andReidLessThanOrEqualTo(Integer value) {
            addCriterion("reid <=", value, "reid");
            return (Criteria) this;
        }

        public Criteria andReidIn(List<Integer> values) {
            addCriterion("reid in", values, "reid");
            return (Criteria) this;
        }

        public Criteria andReidNotIn(List<Integer> values) {
            addCriterion("reid not in", values, "reid");
            return (Criteria) this;
        }

        public Criteria andReidBetween(Integer value1, Integer value2) {
            addCriterion("reid between", value1, value2, "reid");
            return (Criteria) this;
        }

        public Criteria andReidNotBetween(Integer value1, Integer value2) {
            addCriterion("reid not between", value1, value2, "reid");
            return (Criteria) this;
        }

        public Criteria andUidIsNull() {
            addCriterion("uid is null");
            return (Criteria) this;
        }

        public Criteria andUidIsNotNull() {
            addCriterion("uid is not null");
            return (Criteria) this;
        }

        public Criteria andUidEqualTo(Integer value) {
            addCriterion("uid =", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotEqualTo(Integer value) {
            addCriterion("uid <>", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidGreaterThan(Integer value) {
            addCriterion("uid >", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidGreaterThanOrEqualTo(Integer value) {
            addCriterion("uid >=", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidLessThan(Integer value) {
            addCriterion("uid <", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidLessThanOrEqualTo(Integer value) {
            addCriterion("uid <=", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidIn(List<Integer> values) {
            addCriterion("uid in", values, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotIn(List<Integer> values) {
            addCriterion("uid not in", values, "uid");
            return (Criteria) this;
        }

        public Criteria andUidBetween(Integer value1, Integer value2) {
            addCriterion("uid between", value1, value2, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotBetween(Integer value1, Integer value2) {
            addCriterion("uid not between", value1, value2, "uid");
            return (Criteria) this;
        }

        public Criteria andDelivertimeIsNull() {
            addCriterion("delivertime is null");
            return (Criteria) this;
        }

        public Criteria andDelivertimeIsNotNull() {
            addCriterion("delivertime is not null");
            return (Criteria) this;
        }

        public Criteria andDelivertimeEqualTo(Date value) {
            addCriterion("delivertime =", value, "delivertime");
            return (Criteria) this;
        }

        public Criteria andDelivertimeNotEqualTo(Date value) {
            addCriterion("delivertime <>", value, "delivertime");
            return (Criteria) this;
        }

        public Criteria andDelivertimeGreaterThan(Date value) {
            addCriterion("delivertime >", value, "delivertime");
            return (Criteria) this;
        }

        public Criteria andDelivertimeGreaterThanOrEqualTo(Date value) {
            addCriterion("delivertime >=", value, "delivertime");
            return (Criteria) this;
        }

        public Criteria andDelivertimeLessThan(Date value) {
            addCriterion("delivertime <", value, "delivertime");
            return (Criteria) this;
        }

        public Criteria andDelivertimeLessThanOrEqualTo(Date value) {
            addCriterion("delivertime <=", value, "delivertime");
            return (Criteria) this;
        }

        public Criteria andDelivertimeIn(List<Date> values) {
            addCriterion("delivertime in", values, "delivertime");
            return (Criteria) this;
        }

        public Criteria andDelivertimeNotIn(List<Date> values) {
            addCriterion("delivertime not in", values, "delivertime");
            return (Criteria) this;
        }

        public Criteria andDelivertimeBetween(Date value1, Date value2) {
            addCriterion("delivertime between", value1, value2, "delivertime");
            return (Criteria) this;
        }

        public Criteria andDelivertimeNotBetween(Date value1, Date value2) {
            addCriterion("delivertime not between", value1, value2, "delivertime");
            return (Criteria) this;
        }

        public Criteria andResumeIdIsNull() {
            addCriterion("resume_id is null");
            return (Criteria) this;
        }

        public Criteria andResumeIdIsNotNull() {
            addCriterion("resume_id is not null");
            return (Criteria) this;
        }

        public Criteria andResumeIdEqualTo(Integer value) {
            addCriterion("resume_id =", value, "resumeId");
            return (Criteria) this;
        }

        public Criteria andResumeIdNotEqualTo(Integer value) {
            addCriterion("resume_id <>", value, "resumeId");
            return (Criteria) this;
        }

        public Criteria andResumeIdGreaterThan(Integer value) {
            addCriterion("resume_id >", value, "resumeId");
            return (Criteria) this;
        }

        public Criteria andResumeIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("resume_id >=", value, "resumeId");
            return (Criteria) this;
        }

        public Criteria andResumeIdLessThan(Integer value) {
            addCriterion("resume_id <", value, "resumeId");
            return (Criteria) this;
        }

        public Criteria andResumeIdLessThanOrEqualTo(Integer value) {
            addCriterion("resume_id <=", value, "resumeId");
            return (Criteria) this;
        }

        public Criteria andResumeIdIn(List<Integer> values) {
            addCriterion("resume_id in", values, "resumeId");
            return (Criteria) this;
        }

        public Criteria andResumeIdNotIn(List<Integer> values) {
            addCriterion("resume_id not in", values, "resumeId");
            return (Criteria) this;
        }

        public Criteria andResumeIdBetween(Integer value1, Integer value2) {
            addCriterion("resume_id between", value1, value2, "resumeId");
            return (Criteria) this;
        }

        public Criteria andResumeIdNotBetween(Integer value1, Integer value2) {
            addCriterion("resume_id not between", value1, value2, "resumeId");
            return (Criteria) this;
        }

        public Criteria andIsreadIsNull() {
            addCriterion("isread is null");
            return (Criteria) this;
        }

        public Criteria andIsreadIsNotNull() {
            addCriterion("isread is not null");
            return (Criteria) this;
        }

        public Criteria andIsreadEqualTo(Integer value) {
            addCriterion("isread =", value, "isread");
            return (Criteria) this;
        }

        public Criteria andIsreadNotEqualTo(Integer value) {
            addCriterion("isread <>", value, "isread");
            return (Criteria) this;
        }

        public Criteria andIsreadGreaterThan(Integer value) {
            addCriterion("isread >", value, "isread");
            return (Criteria) this;
        }

        public Criteria andIsreadGreaterThanOrEqualTo(Integer value) {
            addCriterion("isread >=", value, "isread");
            return (Criteria) this;
        }

        public Criteria andIsreadLessThan(Integer value) {
            addCriterion("isread <", value, "isread");
            return (Criteria) this;
        }

        public Criteria andIsreadLessThanOrEqualTo(Integer value) {
            addCriterion("isread <=", value, "isread");
            return (Criteria) this;
        }

        public Criteria andIsreadIn(List<Integer> values) {
            addCriterion("isread in", values, "isread");
            return (Criteria) this;
        }

        public Criteria andIsreadNotIn(List<Integer> values) {
            addCriterion("isread not in", values, "isread");
            return (Criteria) this;
        }

        public Criteria andIsreadBetween(Integer value1, Integer value2) {
            addCriterion("isread between", value1, value2, "isread");
            return (Criteria) this;
        }

        public Criteria andIsreadNotBetween(Integer value1, Integer value2) {
            addCriterion("isread not between", value1, value2, "isread");
            return (Criteria) this;
        }

        public Criteria andNoticeinterviewIsNull() {
            addCriterion("noticeinterview is null");
            return (Criteria) this;
        }

        public Criteria andNoticeinterviewIsNotNull() {
            addCriterion("noticeinterview is not null");
            return (Criteria) this;
        }

        public Criteria andNoticeinterviewEqualTo(Integer value) {
            addCriterion("noticeinterview =", value, "noticeinterview");
            return (Criteria) this;
        }

        public Criteria andNoticeinterviewNotEqualTo(Integer value) {
            addCriterion("noticeinterview <>", value, "noticeinterview");
            return (Criteria) this;
        }

        public Criteria andNoticeinterviewGreaterThan(Integer value) {
            addCriterion("noticeinterview >", value, "noticeinterview");
            return (Criteria) this;
        }

        public Criteria andNoticeinterviewGreaterThanOrEqualTo(Integer value) {
            addCriterion("noticeinterview >=", value, "noticeinterview");
            return (Criteria) this;
        }

        public Criteria andNoticeinterviewLessThan(Integer value) {
            addCriterion("noticeinterview <", value, "noticeinterview");
            return (Criteria) this;
        }

        public Criteria andNoticeinterviewLessThanOrEqualTo(Integer value) {
            addCriterion("noticeinterview <=", value, "noticeinterview");
            return (Criteria) this;
        }

        public Criteria andNoticeinterviewIn(List<Integer> values) {
            addCriterion("noticeinterview in", values, "noticeinterview");
            return (Criteria) this;
        }

        public Criteria andNoticeinterviewNotIn(List<Integer> values) {
            addCriterion("noticeinterview not in", values, "noticeinterview");
            return (Criteria) this;
        }

        public Criteria andNoticeinterviewBetween(Integer value1, Integer value2) {
            addCriterion("noticeinterview between", value1, value2, "noticeinterview");
            return (Criteria) this;
        }

        public Criteria andNoticeinterviewNotBetween(Integer value1, Integer value2) {
            addCriterion("noticeinterview not between", value1, value2, "noticeinterview");
            return (Criteria) this;
        }

        public Criteria andInterviewtimeIsNull() {
            addCriterion("interviewtime is null");
            return (Criteria) this;
        }

        public Criteria andInterviewtimeIsNotNull() {
            addCriterion("interviewtime is not null");
            return (Criteria) this;
        }

        public Criteria andInterviewtimeEqualTo(Date value) {
            addCriterion("interviewtime =", value, "interviewtime");
            return (Criteria) this;
        }

        public Criteria andInterviewtimeNotEqualTo(Date value) {
            addCriterion("interviewtime <>", value, "interviewtime");
            return (Criteria) this;
        }

        public Criteria andInterviewtimeGreaterThan(Date value) {
            addCriterion("interviewtime >", value, "interviewtime");
            return (Criteria) this;
        }

        public Criteria andInterviewtimeGreaterThanOrEqualTo(Date value) {
            addCriterion("interviewtime >=", value, "interviewtime");
            return (Criteria) this;
        }

        public Criteria andInterviewtimeLessThan(Date value) {
            addCriterion("interviewtime <", value, "interviewtime");
            return (Criteria) this;
        }

        public Criteria andInterviewtimeLessThanOrEqualTo(Date value) {
            addCriterion("interviewtime <=", value, "interviewtime");
            return (Criteria) this;
        }

        public Criteria andInterviewtimeIn(List<Date> values) {
            addCriterion("interviewtime in", values, "interviewtime");
            return (Criteria) this;
        }

        public Criteria andInterviewtimeNotIn(List<Date> values) {
            addCriterion("interviewtime not in", values, "interviewtime");
            return (Criteria) this;
        }

        public Criteria andInterviewtimeBetween(Date value1, Date value2) {
            addCriterion("interviewtime between", value1, value2, "interviewtime");
            return (Criteria) this;
        }

        public Criteria andInterviewtimeNotBetween(Date value1, Date value2) {
            addCriterion("interviewtime not between", value1, value2, "interviewtime");
            return (Criteria) this;
        }

        public Criteria andIsinterviewIsNull() {
            addCriterion("isinterview is null");
            return (Criteria) this;
        }

        public Criteria andIsinterviewIsNotNull() {
            addCriterion("isinterview is not null");
            return (Criteria) this;
        }

        public Criteria andIsinterviewEqualTo(Integer value) {
            addCriterion("isinterview =", value, "isinterview");
            return (Criteria) this;
        }

        public Criteria andIsinterviewNotEqualTo(Integer value) {
            addCriterion("isinterview <>", value, "isinterview");
            return (Criteria) this;
        }

        public Criteria andIsinterviewGreaterThan(Integer value) {
            addCriterion("isinterview >", value, "isinterview");
            return (Criteria) this;
        }

        public Criteria andIsinterviewGreaterThanOrEqualTo(Integer value) {
            addCriterion("isinterview >=", value, "isinterview");
            return (Criteria) this;
        }

        public Criteria andIsinterviewLessThan(Integer value) {
            addCriterion("isinterview <", value, "isinterview");
            return (Criteria) this;
        }

        public Criteria andIsinterviewLessThanOrEqualTo(Integer value) {
            addCriterion("isinterview <=", value, "isinterview");
            return (Criteria) this;
        }

        public Criteria andIsinterviewIn(List<Integer> values) {
            addCriterion("isinterview in", values, "isinterview");
            return (Criteria) this;
        }

        public Criteria andIsinterviewNotIn(List<Integer> values) {
            addCriterion("isinterview not in", values, "isinterview");
            return (Criteria) this;
        }

        public Criteria andIsinterviewBetween(Integer value1, Integer value2) {
            addCriterion("isinterview between", value1, value2, "isinterview");
            return (Criteria) this;
        }

        public Criteria andIsinterviewNotBetween(Integer value1, Integer value2) {
            addCriterion("isinterview not between", value1, value2, "isinterview");
            return (Criteria) this;
        }

        public Criteria andEmpIdIsNull() {
            addCriterion("emp_id is null");
            return (Criteria) this;
        }

        public Criteria andEmpIdIsNotNull() {
            addCriterion("emp_id is not null");
            return (Criteria) this;
        }

        public Criteria andEmpIdEqualTo(Integer value) {
            addCriterion("emp_id =", value, "empId");
            return (Criteria) this;
        }

        public Criteria andEmpIdNotEqualTo(Integer value) {
            addCriterion("emp_id <>", value, "empId");
            return (Criteria) this;
        }

        public Criteria andEmpIdGreaterThan(Integer value) {
            addCriterion("emp_id >", value, "empId");
            return (Criteria) this;
        }

        public Criteria andEmpIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("emp_id >=", value, "empId");
            return (Criteria) this;
        }

        public Criteria andEmpIdLessThan(Integer value) {
            addCriterion("emp_id <", value, "empId");
            return (Criteria) this;
        }

        public Criteria andEmpIdLessThanOrEqualTo(Integer value) {
            addCriterion("emp_id <=", value, "empId");
            return (Criteria) this;
        }

        public Criteria andEmpIdIn(List<Integer> values) {
            addCriterion("emp_id in", values, "empId");
            return (Criteria) this;
        }

        public Criteria andEmpIdNotIn(List<Integer> values) {
            addCriterion("emp_id not in", values, "empId");
            return (Criteria) this;
        }

        public Criteria andEmpIdBetween(Integer value1, Integer value2) {
            addCriterion("emp_id between", value1, value2, "empId");
            return (Criteria) this;
        }

        public Criteria andEmpIdNotBetween(Integer value1, Integer value2) {
            addCriterion("emp_id not between", value1, value2, "empId");
            return (Criteria) this;
        }

        public Criteria andIsavailIsNull() {
            addCriterion("isavail is null");
            return (Criteria) this;
        }

        public Criteria andIsavailIsNotNull() {
            addCriterion("isavail is not null");
            return (Criteria) this;
        }

        public Criteria andIsavailEqualTo(Integer value) {
            addCriterion("isavail =", value, "isavail");
            return (Criteria) this;
        }

        public Criteria andIsavailNotEqualTo(Integer value) {
            addCriterion("isavail <>", value, "isavail");
            return (Criteria) this;
        }

        public Criteria andIsavailGreaterThan(Integer value) {
            addCriterion("isavail >", value, "isavail");
            return (Criteria) this;
        }

        public Criteria andIsavailGreaterThanOrEqualTo(Integer value) {
            addCriterion("isavail >=", value, "isavail");
            return (Criteria) this;
        }

        public Criteria andIsavailLessThan(Integer value) {
            addCriterion("isavail <", value, "isavail");
            return (Criteria) this;
        }

        public Criteria andIsavailLessThanOrEqualTo(Integer value) {
            addCriterion("isavail <=", value, "isavail");
            return (Criteria) this;
        }

        public Criteria andIsavailIn(List<Integer> values) {
            addCriterion("isavail in", values, "isavail");
            return (Criteria) this;
        }

        public Criteria andIsavailNotIn(List<Integer> values) {
            addCriterion("isavail not in", values, "isavail");
            return (Criteria) this;
        }

        public Criteria andIsavailBetween(Integer value1, Integer value2) {
            addCriterion("isavail between", value1, value2, "isavail");
            return (Criteria) this;
        }

        public Criteria andIsavailNotBetween(Integer value1, Integer value2) {
            addCriterion("isavail not between", value1, value2, "isavail");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}