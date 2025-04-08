# 백엔드 실행을 위한 엔드 포인트 및 서버 실행 스크립트
# main.py

import os
from fastapi import FastAPI
from pydantic import BaseModel
from typing import Dict
from dotenv import load_dotenv
import uvicorn

# agent 모듈에서 함수 가져오기
from agent.agent import generate_positive_statements

# (1) .env 로드
load_dotenv()  # backend/.env 파일 읽어옴

app = FastAPI()

# (2) 요청 바디 정의
class RequestBody(BaseModel):
    user_input: str


# (3) 응답 바디 정의 (샘플)
class ResponseBody(BaseModel):
    user_input: str
    Answer1: str
    Answer2: str
    Answer3: str


# (4) 라우트 정의
@app.post("/generate", response_model=ResponseBody)
def create_statements(request: RequestBody) -> Dict:
    """
    user_input을 받아서 긍정적 화법 3문장을 생성해 반환
    """
    user_input = request.user_input

    # agent의 함수 호출
    answer1, answer2, answer3 = generate_positive_statements(user_input)

    # 원하는 형태의 JSON 반환
    return {
        "user_input": user_input,
        "Answer1": answer1,
        "Answer2": answer2,
        "Answer3": answer3,
    }

# (5) 서버 자동 실행
if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)